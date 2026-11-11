# Gen1 Stationary Bot (`stationarybot.lua`)

## 1. Name & Description
- **Tool:** `stationarybot.lua`
- **Description:** Automated Lua script for VBA-M running Generation 1 Pokémon games to soft-reset for shiny stationary encounters (legendaries and interactive overworld Pokémon).

## 2. Functionality
- Detects ROM version, monitors battle-start flag (`0xC027`), reads enemy DV memory addresses immediately upon encounter start, and soft-resets if not shiny.

## 3. Supported Pokémon & Games
- **Games:** Pokémon Red, Blue, Yellow, Green (JPN, USA, EUR).
- **Targets:** Snorlax, Zapdos, Articuno, Moltres, Mewtwo, Electrode, Voltorb.

## 4. Generation
- Generation 1 (RBY).

## 5. Required Emulator
- VisualBoyAdvance-M (VBA-M) vba rr 23.6.

## 6. Tested Emulator Versions
- VBA-M rr 23.6 (Verified).

## 7. Prerequisites
- Save state right in front of the stationary Pokémon (one A press away from encounter).

## 8. Dependencies
- `shared.tables.gen1_addresses.lua`

## 9. Installation
- Place in `tools/gen1/rby-vba/stationary/stationarybot.lua`.

## 10. Configuration
- Ensure you are facing the target; save state before interaction.

## 11. Step-by-Step Execution Instructions
1. Facing the target, save state.
2. Run `stationarybot.lua` in the Lua window.
3. Bot presses A, waits for battle flag `0xC027 == 0xF0`, checks DVs, and loops.

## 12. Configurable Parameters
- None required in code.

## 13. Available Controls
- Automated via joypad 1.

## 14. Internal Operation
- Uses `shared.tables.gen1_addresses` for version detection and enemy DV address mappings. Evaluates Gen 1 shiny formula.

## 15. Expected Output
- Console logs soft-reset count, DVs, and halts upon shiny discovery.

## 16. Troubleshooting
- If battle flag detection fails, verify ROM version is supported.

## 17. Known Limitations
- VBA-M rr 23.6 exclusive.

## 18. Authorship & Credits
- **Original author:** zep715 (`zep715/rbylua`).
- **Fork maintainer:** Phosky71.

## 19. License
- **MIT** (applied by PokemonHuntScripts).

## 20. Modification History in PokemonHuntScripts
- Refactored to use `shared.tables.gen1_addresses`.
