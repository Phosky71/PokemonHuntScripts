# CREDITS — PokemonHuntScripts

This document records every integrated tool, its original author, source, license, and modifications made by the PokemonHuntScripts project.

---

## 1. Core Contributors

| Contributor | Role |
|-------------|------|
| **Phosky71** | Repository creator, bug fixer, Gen2 bot developer, Gen1 refactoring. |
| **zep715** | Pioneer of VBA-M Lua scripting for Pokémon. Creator of the `rbylua` base. |
| **wwwwwwzx** | Author of the comprehensive `gsclua` suite for Gen 2. |
| **LegoFigure11** | Contributor to Gen 1 fishing and trade scripts. |

---

## 2. Integrated Tool Registry

### Shared Infrastructure
- **`shared/tables/gen1_addresses.lua`**: Created by PokemonHuntScripts (2026). MIT. Canonical memory map for Gen 1.

### Generation 1 (RBY)
| Script | Author(s) | Original Source | License | Modifications |
|--------|-----------|-----------------|---------|---------------|
| `giftbot.lua` | zep715 | [rbylua](https://github.com/zep715/rbylua) | MIT* | Refactored with `shared/tables`. |
| `stationarybot.lua` | zep715 | [rbylua](https://github.com/zep715/rbylua) | MIT* | Refactored with `shared/tables`. |
| `fishbot.lua` | zep715, Phosky71 | [rbylua](https://github.com/Phosky71/rbylua) | MIT* | Optimizations by Phosky71. |
| `autospecie_fishingbot.lua` | LegoFigure11, Phosky71 | [rbylua](https://github.com/Phosky71/rbylua) | MIT* | **CRITICAL BUG FIX** (DV check logic). |
| `InGameTrade.lua` | Phosky71 | [rbylua](https://github.com/Phosky71/rbylua) | MIT* | Frame-advance loops refactoring. |
| `nature_checker.lua` | Collector Togami, Phosky71 | [rbylua](https://github.com/Phosky71/rbylua) | MIT* | Version detection upgrade. |
| `tidbot.lua` | zep715 | [rbylua](https://github.com/zep715/rbylua) | MIT* | Baseline restoration. |

### Generation 2 (GSC)
| Script | Author(s) | Original Source | License | Modifications |
|--------|-----------|-----------------|---------|---------------|
| **`gsclua` Suite** | wwwwwwzx | [gsclua](https://github.com/wwwwwwzx/gsclua) | MIT | Vendored verbatim (20 files). |
| `Crystal_Suicune.lua` | Phosky71 | Phosky71 Repo | MIT* | Specialized Suicune logic. |
| `WildLegandaryBot.lua` | Phosky71 | Phosky71 Repo | MIT* | Specialized Roamer hunt. |

*\*MIT applied by PokemonHuntScripts project; upstream repository did not specify a license.*

---

## 3. Acknowledgements
- **Real96**: For better region/version checks and extensive RAM address discovery in Gen 2.
- **Sipanale**: For contributions to legendary beast hunting logic.
- **RichardPaulAstley**: For assistance with RAM addresses and testing.
- **Koroze23**: For testing Korean version support.

---

## 4. Upstream Repositories
- `zep715/rbylua`: Foundation for RBY scripting.
- `wwwwwwzx/gsclua`: Comprehensive GSC suite.
- `Real96/PokeLua`: Reference for memory addresses (GPL-3.0).

---

## 5. Licensing Note
This repository uses the MIT License for its own contributions. Every integrated script preserves its original attribution. Where no license was provided upstream, we have applied the MIT License to facilitate redistribution while maintaining author credit.
