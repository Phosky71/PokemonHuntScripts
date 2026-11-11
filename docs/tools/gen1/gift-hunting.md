# Gen1 Gift & Starter Bot (`giftbot.lua`)

## 1. Name & Description
- **Tool:** `giftbot.lua`
- **Description:** Automated Lua script for VBA-M running Generation 1 Pokémon games (Red, Blue, Yellow, Green JPN) to soft-reset for shiny gifts, starters, fossils, and in-game prizes.

## 2. Functionality
- Automatically detects ROM version, reads party count and party slot DV memory addresses, presses A through the gift dialogue (selecting "no nickname"), checks DVs against the Gen 1 shiny criteria, and soft-resets if not shiny.

## 3. Supported Pokémon & Games
- **Games:** Pokémon Red, Blue, Yellow, Green (JPN, USA, EUR).
- **Targets:** Starters (Bulbasaur, Charmander, Squirtle), Fossils (Omanyte, Kabuto, Aerodactyl), Eevee, Lapras, Game Corner prizes.

## 4. Generation
- Generation 1 (RBY).

## 5. Required Emulator
- VisualBoyAdvance-M (VBA-M) vba rr 23.6.

## 6. Tested Emulator Versions
- VBA-M rr 23.6 (Verified).

## 7. Prerequisites
- Save state right before receiving the gift / starter (before pressing A on the final dialogue box).

## 8. Dependencies
- `shared.tables.gen1_addresses.lua`

## 9. Installation
- Place in `tools/gen1/rby-vba/gift/giftbot.lua`.

## 10. Configuration
- Position player in front of the gift NPC or pokéball object; save state right before acquiring.

## 11. Step-by-Step Execution Instructions
1. Load state right before getting the gift.
2. Open VBA-M Lua scripting window, load `giftbot.lua`, and run.
3. Bot automatically advances frames, checks DVs upon receiving the Pokémon, and loops until shiny.

## 12. Configurable Parameters
- None required in code.

## 13. Available Controls
- Automated via joypad 1 (`A = true`).

## 14. Internal Operation
- Uses `shared.tables.gen1_addresses` for version detection and party offset calculation. Reads DVs from party slot base address `+ 0x23 + size * 0x2C`. Evaluates Gen 1 shiny formula (`spespc == 0xAA` and valid `atkdef`).

## 15. Expected Output
- Console logs soft-reset count, DVs, and halts upon shiny discovery.

## 16. Troubleshooting
- Ensure save state is placed precisely before the gift is added to the party.

## 17. Known Limitations
- VBA-M rr 23.6 exclusive.

## 18. Authorship & Credits
- **Original author:** zep715 (`zep715/rbylua`).
- **Fork maintainer:** Phosky71.

## 19. License
- **MIT** (applied by PokemonHuntScripts).

## 20. Modification History in PokemonHuntScripts
- Refactored to use `shared.tables.gen1_addresses`.
