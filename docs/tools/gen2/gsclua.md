# Gen2 GSC Lua Suite (`gsclua`)

## 1. Name & Description
- **Tool:** `gsclua` suite by `wwwwwwzx`.
- **Description:** A comprehensive collection of Lua scripts for Pokémon Gold, Silver, and Crystal, providing automation for almost every shiny hunting method available in Generation 2.

## 2. Functionality
The suite is divided into **Bots** (automation) and **Viewers** (real-time data display).

### Bots
- **`gsc_wild.lua`**: Automates grass/cave encounters. Move player to grass; bot walks left/right until encounter, checks DVs, and pauses/resets.
- **`gsc_stationary.lua`**: Automates stationary encounters (Lugia, Ho-Oh, Celebi, Sudowoodo). Save in front of the Pokémon.
- **`c_suicune.lua`**: Specialized bot for Crystal Suicune.
- **`gsc_gift.lua`**: Automates gift Pokémon (Starters, Eevee, Shuckle, Tyrogue). Save before the final A-press to receive.
- **`gsc_egg.lua`**: Automates egg hatching. Run after picking up the egg from the Day Care.
- **`gsc_tid.lua`**: Automates Trainer ID (TID) hunting. Run at the "New Game" screen.
- **`gsc_fish.lua`**: Automated fishing. Highlight "USE" on the rod in the bag.
- **`gsc_headbutt.lua`**: Automates Headbutt tree encounters.
- **`gsc_unown.lua`**: Specialized bot for hunting specific Unown forms (A-Z).
- **`gsc_wild_legendary_beasts.lua`**: Automates hunting and capturing roaming Raikou, Entei, and Suicune.
- **`gsc_catch.lua`**: Simple bot that spams Poké Balls and resets if capture fails.
- **`gsc_holditem_search.lua`**: Searches for specific wild hold items (e.g., Lucky Egg).

### Viewers
- **`gsc_WildView.lua`**: Displays DVs, HP, and Hold Item of wild encounters.
- **`gsc_PartyView.lua`**: Displays DVs and Natures of party Pokémon.
- **`gsc_DayCareView.lua`**: Displays DVs and Natures of Pokémon in the Day Care.
- **`gsc_RoamerTracker.lua`**: Tracks the current location and DVs of the Roaming Beasts.

## 3. Supported Pokémon & Games
- **Games:** Pokémon Gold, Silver, and Crystal (JPN, USA, EUR, KOR).
- **Pokémon:** All Pokémon available in Gen 2 via the respective methods.

## 4. Generation
- Generation 2 (GSC).

## 5. Required Emulator
- **VisualBoyAdvance-M (VBA-M)** — specifically **vba rr 23.6**.

## 6. Tested Emulator Versions
- VBA-M rr 23.6 (Verified).

## 7. Prerequisites
- VBA-M rr 23.6.
- Compatible ROM.
- Specific save location depending on the bot (see section 2).

## 8. Dependencies
- None.

## 9. Installation
- Scripts are located in `tools/gen2/gsclua/`.

## 10. Configuration
- Many bots have a `desired_species` or `desired_tid` parameter at the top of the file. Edit these with a text editor before running.

## 11. Step-by-Step Execution Instructions
1. Load your game and reach the required position/screen.
2. In VBA-M: **Tools → Lua Scripting → New Lua Script Window**.
3. **Browse** to the desired script in `tools/gen2/gsclua/` and click **Run**.
4. Monitor the console for output.

## 12. Configurable Parameters
- `desired_species`: Pokédex number of the target.
- `desired_tid`: Target Trainer ID.
- `pause`: Whether to pause the emulator on shiny find.

## 13. Available Controls
- Scripts generally handle all inputs automatically. Stop the script in the Lua window to regain control.

## 14. Internal Operation (RNG / Memory DVs)
- **Version Detection:** Detects version and region by reading memory offsets `0x141` and `0x142`.
- **Shiny Criterion:** Standard Gen 2 shiny formula (identical to Gen 1).
  $$\text{Def=10, Spe=10, Spc=10; Atk} \in \{2, 3, 6, 7, 10, 11, 14, 15\}$$

## 15. Expected Output
- Real-time logs of encounters/resets. "Shiny found!" message and halt on success.

## 16. Troubleshooting
- *Script doesn't start:* Ensure you are using VBA-M rr 23.6.
- *Wrong memory reads:* Ensure the ROM is a clean, supported version.

## 17. Known Limitations
- Does not work on modern VBA-M or mGBA without API translation.

## 18. Authorship & Credits
- **Original author:** `wwwwwwzx`.
- **Contributors:** `zep715` (base logic), `Real96` (region/version checks), `Sipanale` (roaming beasts).

## 19. License
- **MIT** (Upstream license preserved in `LICENSE-upstream-MIT`).

## 20. Modification History in PokemonHuntScripts
- Vendored as a complete suite for Gen 2.
