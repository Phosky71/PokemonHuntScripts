# Technical Mechanics — Generation 1 & Generation 2

## 1. Overview & Scope
This document provides a technical explanation of the core game mechanics, RAM structures, RNG behavior, and DV formulas utilized by the Lua scripts in **PokemonHuntScripts**. It covers Generation 1 (Pokémon Red, Blue, Yellow, Green) and Generation 2 (Pokémon Gold, Silver, Crystal).

---

## 2. Determinación de Pokémon Shiny / Shiny Determination

In Generation 1 and Generation 2, shininess is determined **entirely by DVs (Determinant Values)**. There is no Personality Value (PID) or Trainer ID (TID) XOR check as in Gen 3+.

### DV Data Structure
In RAM, a Pokémon's DVs are stored in 2 consecutive bytes (16 bits total):
- **Byte 1 (`atkdef`):** High nibble = Attack DV (0–15), Low nibble = Defense DV (0–15).
- **Byte 2 (`spespc`):** High nibble = Speed DV (0–15), Low nibble = Special DV (0–15).
- **HP DV:** Calculated implicitly from the lowest bit of the other four DVs:
  $$\text{HP DV} = 8 \times (\text{Atk} \bmod 2) + 4 \times (\text{Def} \bmod 2) + 2 \times (\text{Spe} \bmod 2) + 1 \times (\text{Spc} \bmod 2)$$

### Shiny Criteria
A Pokémon is Shiny if and only if:
1. **Defense DV** = 10 (`0xA`)
2. **Speed DV** = 10 (`0xA`)
3. **Special DV** = 10 (`0xA`)
4. **Attack DV** $\in \{2, 3, 6, 7, 10, 11, 14, 15\}$ (i.e. binary `0x2`, `0x3`, `0x6`, `0x7`, `0xA`, `0xB`, `0xE`, `0xF`)

### Hexadecimal Memory Value Formula
- **`spespc` Byte:** Must equal `0xAA` (Speed = 10, Special = 10).
- **`atkdef` Byte:** Must equal one of `{0x2A, 0x3A, 0x6A, 0x7A, 0xAA, 0xBA, 0xEA, 0xFA}`.

### Probability
$$\text{Probability} = \frac{8 \text{ valid Attack DVs}}{16 \times 16 \times 16 \times 16} = \frac{8}{65,536} = \frac{1}{8,192}$$

---

## 3. Virtual Natures (Gen 1 Poké Transporter Conversion)
Generation 1 does not have Natures natively. However, when transferred to Generation 7/8 via Poké Transporter, Natures are assigned deterministically:
$$\text{Nature Index} = \text{Total Exp} \bmod 25$$

`nature_checker.lua` calculates this value dynamically in RAM to allow Gen 1 players to hunt for specific Natures before transferring.

---

## 4. RAM Addresses & Memory Structures

### Generation 1 Memory Map (VBA-M)
- **Header Checksum:** `0x014E` (Word) — Used for version auto-detection.
- **Battle Flag:** `0xC027` — Reaches `0xF0` when battle sequence begins.
- **Fishing Bite Flag:** `0xCD3D` — `0x01` = Bite, `0x02` = No fish, `0x00` = Nibble.
- **Enemy DV Address:**
  - JPN Red/Green/Blue/Yellow: `0xCFD8`
  - USA Red/Blue: `0xCFF1`
  - USA Yellow: `0xCFF0`
  - EUR Red/Blue: `0xCFF6`
  - EUR Yellow: `0xCFF5`

### Generation 2 Memory Map (VBA-M)
- **Version ID:** `0x0141` (`0x54` = Crystal, `0x55` = Gold, `0x58` = Silver)
- **Region ID:** `0x0142` (`0x44`/`0x45`/`0x4A`/`0x4B`/`0x53`)
- **Enemy DV Address (`enemy_addr`):**
  - USA/EUR Crystal: `0xD20C`
  - JPN Crystal: `0xD23D`
  - USA/EUR Gold/Silver: `0xD0F5`
  - JPN Gold/Silver: `0xD0E7`
  - KOR Gold/Silver: `0xD1B2`

---

## 5. Frame Timing & Execution Mechanics
- **Frame Rate:** Game Boy / Game Boy Color runs at ~59.73 Hz.
- **Soft-Resetting:** Performed by saving an emulator state (`savestate.save`) before triggering an encounter, then restoring state (`savestate.load`) if DVs fail the shiny check.
- **Dialogue Automation:** Input loops (`joypad.set(1, {A = true})` combined with `emu.frameadvance()`) advance text frames deterministically.

---

## 6. Method-Specific Mechanics

### 1. Gift / Starter Encounters
DVs are generated when the Pokémon is added to the party array. The script reads DVs directly from party RAM slot `(base_address + 0x23) + size * 0x2C`.

### 2. Stationary Encounters
DVs are assigned when the battle structure initializes. The script waits for battle flag `0xC027 == 0xF0`, then reads `enemy_addr`.

### 3. Fishing
The game checks fishing encounter tables upon pressing A. The script checks `a_flagbite` at `0xCD3D` and `a_fished_species`, proceeding to DV verification only if species matches the target.

### 4. Roaming Legendary Beasts (Gen 2)
Roamer locations shift between routes upon map transitions. `WildLegandaryBot.lua` alternates movement between Route 38 and Ecruteak City to force map reloads until a Roamer spawns on the current route.
