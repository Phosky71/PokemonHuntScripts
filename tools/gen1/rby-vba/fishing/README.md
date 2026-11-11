# Gen1 Fishing Bots

## fishbot.lua

- **Author:** zep715 (original) / Phosky71 (optimised)
- **Source:** `https://github.com/zep715/rbylua`
- **License:** MIT (applied by PokemonHuntScripts; upstream had no license)
- **Method:** User sets a target species index number; bot casts, reads `biteFlagAddr` (0xCD3D),
  verifies species, then soft-resets to check IVs after dialogue.

### Prerequisites
- VBA-M rr 23.6
- ROM loaded
- Position cursor over `USE` and run the script
- Edit `local target = <index>` before running

## autospecie_fishingbot.lua

- **Author:** LegoFigure11 (original) / Phosky71 (upgrade)
- **Source:** `https://github.com/Phosky71/rbylua`
- **License:** MIT (applied by PokemonHuntScripts; upstream had no license)
- **Method:** Automatically detects species from memory, then enters shiny-hunt mode
  for the first species found.

### Prerequisites
- VBA-M rr 23.6
- ROM loaded
- Position cursor over `USE` and run the script

### Bugs fixed by PokemonHuntScripts
1. **CRITICAL — Inverted shiny DV check** (0xA2/0xA3 → 0x2A/0x3A): The original script
   used `atkdef == 0xA2` (nibbles A,2) instead of `0x2A` (nibbles 2,A). Gen1 Gen2 shiny
   requires `def=10(A), spe=10(A), spc=10(A)` with `atk ∈ {2,3,6,7,10,11,14,15}`.
   The inverted check compared `atkdef` against `{0xA2, 0xA3, ...}` — nibbles 10,2 — which
   is the **Attack=10, Defense=2** pattern (pre-1.3 Poké Transporter / VC swapped rule).
   The script would **never detect a shiny**. Fixed to match the canonical rule.
2. **Inverted Spe/Spc labels** in the "shiny found" print: `Spc:` was printed as
   `math.floor(spespc/16)` (Speed) and `Spe:` as `spespc%16` (Special). Swapped.
3. **Duplicate `target == 128` branch**: Dewgong is Gen1 index 120, not 128. The
   script had two `target == 128` checks; the first assigned "Dewgong", the second
   "Golduck". Golduck shadowed Dewgong forever. Fixed: Dewgong → `target == 120`.
4. **Undeclared `target_species` variable**: Now initialized to `"Unknown"` before the
   chain of if/else.
