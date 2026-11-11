# Gen1 Information & Utility Tools

## 1. Name & Description
- **Tools:** `nature_checker.lua`, `tidbot.lua`, `shiny_checker.lua`.
- **Description:** Utility scripts for Generation 1 (RBY) to verify Pokémon data and automate setup tasks.

## 2. Functionality
- **`nature_checker.lua`**: Displays the Nature of Pokémon in your party on the emulator screen. Since Natures were introduced in Gen 3, this script calculates the "virtual nature" based on Experience points (Exp % 25) which is used by Poké Transporter when moving Pokémon to modern games. It also flags party Pokémon that meet the Gen 1 shiny DV criteria.
- **`tidbot.lua`**: Automates "New Game" resets to hunt for a specific Trainer ID (TID).
- **`shiny_checker.lua`**: (Placeholder) Intended to check party shininess; currently an empty stub.

## 3. Supported Games
- Pokémon Red, Blue, Yellow, Green (JPN, USA, EUR).

## 4. Generation
- Generation 1 (RBY).

## 5. Required Emulator
- VBA-M rr 23.6.

## 6. Tested Emulator Versions
- VBA-M rr 23.6.

## 7. Prerequisites
- **`nature_checker.lua`**: Have Pokémon in your party.
- **`tidbot.lua`**: Be at the "New Game" screen.

## 8. Dependencies
- None (Internal version detection).

## 9. Installation
- `tools/gen1/rby-vba/info/`

## 10. Configuration
- **`tidbot.lua`**: Edit `local desired_tid = 0` to your target ID.

## 11. Step-by-Step Execution Instructions
1. Run the script in the VBA-M Lua window.
2. For `nature_checker.lua`, the info appears on the screen overlay.
3. For `tidbot.lua`, the bot will reset until the TID is found.

## 12. Configurable Parameters
- `desired_tid`: Target ID for `tidbot.lua`.

## 13. Available Controls
- `nature_checker.lua` is passive.
- `tidbot.lua` is fully automated.

## 14. Internal Operation
- **Nature Calculation:** `Exp % 25` mapped to the 25 standard natures.
- **TID Hunting:** Monitors memory address `a_tid` (e.g., `0xD359` for USA Red/Blue) and resets the game state.

## 15. Expected Output
- **`nature_checker.lua`**: On-screen text like "1 Lonely shiny".
- **`tidbot.lua`**: Console logs of generated TIDs.

## 16. Troubleshooting
- If no text appears in `nature_checker.lua`, ensure the ROM version is correctly detected in the console.

## 17. Known Limitations
- `shiny_checker.lua` is currently non-functional.

## 18. Authorship & Credits
- **`nature_checker.lua`**: Collector Togami (Original), Phosky71 (Optimization).
- **`tidbot.lua`**: zep715.

## 19. License
- **MIT** (applied by PokemonHuntScripts).
