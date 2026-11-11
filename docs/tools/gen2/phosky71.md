# Phosky71 Gen2 Scripts (`Crystal_Suicune.lua` & `WildLegandaryBot.lua`)

## 1. Name & Description
- **Tools:** `Crystal_Suicune.lua` and `WildLegandaryBot.lua`.
- **Description:** Optimized and specialized bots by Phosky71 for high-efficiency hunting in Pokémon Gold, Silver, and Crystal.

## 2. Functionality
- **`Crystal_Suicune.lua`**: Specifically tuned for the Suicune encounter in Tin Tower (Crystal). Automates movement, dialogue, and DV checking with high reliability.
- **`WildLegandaryBot.lua`**: A specialized bot for hunting the Roaming Legendary Beasts (Raikou, Entei, Suicune). It handles route changes (Ecruteak City to Route 38) and automated capture upon finding a shiny.

## 3. Supported Pokémon & Games
- **Games:** Pokémon Gold, Silver, Crystal.
- **Targets:** Suicune (Tin Tower), Raikou/Entei/Suicune (Roaming).

## 4. Generation
- Generation 2 (GSC).

## 5. Required Emulator
- VBA-M rr 23.6.

## 6. Tested Emulator Versions
- VBA-M rr 23.6 (Verified).

## 7. Prerequisites
- **`Crystal_Suicune.lua`**: Facing Suicune in Tin Tower.
- **`WildLegandaryBot.lua`**: In the transition between Ecruteak City and Route 38.

## 8. Dependencies
- None.

## 9. Installation
- `tools/gen2/gsc-vba/phosky71/stationary/Crystal_Suicune.lua`
- `tools/gen2/gsc-vba/phosky71/wild/WildLegandaryBot.lua`

## 10. Configuration
- None required.

## 11. Step-by-Step Execution Instructions
1. Reach the required location in-game.
2. Load the script in the VBA-M Lua window.
3. Run the script.

## 12. Configurable Parameters
- None.

## 13. Available Controls
- Automated Joypad 1.

## 14. Internal Operation
- Uses standard Gen 2 memory addresses for enemy DVs.
- `WildLegandaryBot.lua` includes logic to reset beast locations by moving between a city and a route.

## 15. Expected Output
- Logs DVs and reset counts. Halts on shiny discovery.

## 16. Troubleshooting
- Ensure player is at the exact starting location for `WildLegandaryBot.lua` to avoid movement loops.

## 17. Known Limitations
- VBA-M rr 23.6 exclusive.

## 18. Authorship & Credits
- **Author:** Phosky71.
- **Base:** Inspired by and derived from `wwwwwwzx/gsclua`.

## 19. License
- **MIT** (applied by PokemonHuntScripts).

## 20. Modification History in PokemonHuntScripts
- Initial integration and documentation.
