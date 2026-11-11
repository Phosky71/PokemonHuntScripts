# Gen1 Fishing Bots (`fishbot.lua` & `autospecie_fishingbot.lua`)

## 1. Name & Description
- **Tools:** `fishbot.lua` (manual target species index) and `autospecie_fishingbot.lua` (automated first-species hunting).
- **Description:** Automated Lua scripts for VBA-M running Generation 1 Pokémon games (Red, Blue, Yellow, Green JPN) to fish, check DVs against the Generation 1 shiny criteria, soft-reset on non-shiny encounters, and halt upon finding a shiny.

## 2. Functionality
- **`fishbot.lua`:** Requires the user to edit `local target = <index>` with the Generation 1 index number of the desired Pokémon. The bot casts the rod, reads the bite flag at `0xCD3D`, checks if the fished species matches `target`, waits through the encounter dialogue, reads enemy DV memory addresses, and soft-resets if not shiny.
- **`autospecie_fishingbot.lua`:** Automatically reads the fished species from memory (`a_fished_species`), maps it to a human-readable species name via an extensive if-else chain (supporting 27 fishable species), locks onto that species, and hunt-loops until a shiny is found.

## 3. Supported Pokémon & Games
- **Games:** Pokémon Red, Blue, Yellow, and Green (Japan, USA, Europe).
- **Pokémon:** Any fishable Pokémon in Gen 1 (e.g., Magikarp, Poliwag, Horsea, Dratini, Omanyte, Gyarados, Tentacool, etc.).

## 4. Generation
- Generation 1 (RBY).

## 5. Required Emulator
- **VisualBoyAdvance-M (VBA-M)** — specifically **vba rr 23.6** (Tasvideos / VBA ReRecording build).

## 6. Tested Emulator Versions
- VBA-M rr 23.6 (Verified). Newer versions or other emulators (mGBA, BizHawk) may not support these memory APIs without adaptation.

## 7. Prerequisites
- VBA-M rr 23.6 running a supported Gen 1 ROM.
- A fishing rod (Old Rod, Good Rod, or Super Rod) in the Bag.
- Position the player facing water where Pokémon can be caught.
- Place cursor over `USE` in the Item menu.

## 8. Dependencies
- None for `fishbot.lua`.
- `autospecie_fishingbot.lua` relies on VBA-M Lua memory reading (`memory.readbyte`, `memory.readword`) and savestate functions (`savestate.create`, `savestate.save`, `savestate.load`).

## 9. Installation
1. Place `fishbot.lua` or `autospecie_fishingbot.lua` in `tools/gen1/rby-vba/fishing/`.
2. Open VBA-M rr 23.6 and load your Gen 1 ROM and save file.

## 10. Configuration
- For `fishbot.lua`: Open the script in a text editor and set `local target = <index>` (e.g., `92` for Horsea, `133` for Magikarp). Index numbers follow Bulbapedia Gen 1 index order.
- For `autospecie_fishingbot.lua`: No configuration needed; it auto-detects the first hooked species.

## 11. Step-by-Step Execution Instructions
1. In the game, open your Bag, highlight your Fishing Rod, and place the cursor over **`USE`** (do not press A yet).
2. In VBA-M, go to **Tools → Lua Scripting → New Lua Script Window**.
3. Click **Browse**, select `fishbot.lua` or `autospecie_fishingbot.lua`, and click **Run**.
4. The script will automatically press A to use the rod, wait for a bite, verify the species, and execute soft-resets until a shiny appears.

## 12. Configurable Parameters
- `target`: Species index number (`fishbot.lua` only).
- `a_flagbite`: Memory address for bite detection (`0xCD3D`).

## 13. Available Controls
- Keyboard controls defined in VBA-M. The script takes control of joypad 1 (`joypad.set(1, {A = true})`). Stop the script via the VBA-M Lua window to regain manual control.

## 14. Internal Operation (RNG / Memory DVs)
- **Version Detection:** Reads ROM header sum at `0x14E` to determine JPN, USA, or EUR version and assign correct RAM addresses for fished species and DV storage (`ivs_addr`).
- **Shiny Criterion:** Evaluates Gen 1 shiny formula:
  $$\text{Spc/Spe bytes: spespc} = 0xAA \quad \text{AND} \quad \text{Atk/Def byte: atkdef} \in \{0x2A, 0x3A, 0x6A, 0x7A, 0xAA, 0xBA, 0xEA, 0xFA\}$$
  *(Note: In Gen 1/2, shininess is determined entirely by DVs: Attack = 2,3,6,7,10,11,14,15; Defense = 10; Speed = 10; Special = 10).*

## 15. Expected Output
- Console logs ROM version detected, fishing status ("Nothing bited", "Wrong species", or "Species found, searching for ivs"), and incrementing soft-reset counter with current DVs. Upon finding a shiny, prints `"Shiny found!!!"`, logs final DVs (Atk, Def, Spe, Spc), and halts.

## 16. Troubleshooting
- *Script stops immediately:* Unknown ROM version (unsupported region header sum).
- *Stuck on "Nothing bited":* Ensure player is facing water and has selected a rod correctly.
- *Never finds shiny:* Verify speed multiplier is not causing frame desync; keep emulator speed normal (1x).

## 17. Known Limitations
- VBA-M rr 23.6 exclusive.
- Speed-up features in the emulator can cause memory read race conditions during fishing animation frames.

## 18. Authorship & Credits
- **`fishbot.lua`:** Original author `zep715` (`zep715/rbylua`), optimised by `Phosky71`.
- **`autospecie_fishingbot.lua`:** Original author `LegoFigure11`, upgraded by `Phosky71` (fixed critical inverted shiny DV check, swapped Spe/Spc labels, corrected Dewgong index 120).

## 19. License
- **MIT** (applied by PokemonHuntScripts; upstream had no license).

## 20. Modification History in PokemonHuntScripts
- Fixed critical inverted shiny DV check (`0xA2` → `0x2A`) in `autospecie_fishingbot.lua`.
- Fixed swapped Spe/Spc print labels.
- Corrected duplicate index branch (Dewgong index 120).
