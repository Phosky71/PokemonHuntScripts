# Gen1 In-Game Trade Bots

## 1. Name & Description
- **Tools:** `InGameTrade.lua`, `LegoFigure11_igtbot.lua`, `Zep715_igtbot.lua`.
- **Description:** Automated Lua scripts for VBA-M running Generation 1 games to hunt for shiny Pokémon obtained through in-game trades with NPCs.

## 2. Functionality
- **`InGameTrade.lua` (Recommended):** Modernized script by Phosky71. Fully automated with frame-advance loops. Navigates the trade dialogue, waits for the trade animation, verifies received Pokémon DVs, and soft-resets.
- **`LegoFigure11_igtbot.lua`:** Optimized version of Zep715's script. Includes SR counting.
- **`Zep715_igtbot.lua`:** Original basic trade script.

## 3. Supported Pokémon & Games
- **Games:** Pokémon Red, Blue, Yellow (JPN, USA, EUR).
- **Targets:** All in-game trades (e.g., Lickitung, Farfetch'd, Jynx, Mr. Mime, etc.).

## 4. Generation
- Generation 1 (RBY).

## 5. Required Emulator
- VisualBoyAdvance-M (VBA-M) vba rr 23.6.

## 6. Tested Emulator Versions
- VBA-M rr 23.6 (Verified).

## 7. Prerequisites
- Save state right before the last input before animation (at text "connect your link cable" or equivalent).
- Must have the required Pokémon to trade in the party.

## 8. Dependencies
- None (currently use inline version detection).

## 9. Installation
- Place in `tools/gen1/rby-vba/in-game-trades/`.

## 10. Configuration
- Position player in front of the trading NPC; prepare the source Pokémon.

## 11. Step-by-Step Execution Instructions
1. Face NPC, initiate trade until the final confirmation text.
2. Save state.
3. Run `InGameTrade.lua`.
4. Bot completes the trade and checks for shiny.

## 12. Configurable Parameters
- None.

## 13. Available Controls
- Fully automated.

## 14. Internal Operation
- Calculates party slot of the *received* Pokémon (last slot) and reads DVs after the trade animation.

## 15. Expected Output
- Console logs SR count and DVs. Halts on shiny.

## 16. Troubleshooting
- `InGameTrade.lua` is more stable due to loop-based frame advances. Legacy bots (`LegoFigure11_igtbot.lua`) may not correctly load DVs in some environments.

## 17. Known Limitations
- VBA-M rr 23.6 exclusive.

## 18. Authorship & Credits
- **`InGameTrade.lua`:** Phosky71.
- **`LegoFigure11_igtbot.lua`:** LegoFigure11.
- **`Zep715_igtbot.lua`:** zep715.

## 19. License
- **MIT** (applied by PokemonHuntScripts).

## 20. Modification History in PokemonHuntScripts
- **`InGameTrade.lua`:** Fixed uninitialized `input` table, refactored redundant frame advances into loops, fixed "spe/spc" label.
- **`LegoFigure11_igtbot.lua`:** Fixed critical inverted shiny DV check (`0xA2` → `0x2A`), fixed Spe/Spc labels.
