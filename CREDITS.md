# CREDITS — PokemonHuntScripts

This document records every integrated tool, its original author, source, license, and
modifications made by the PokemonHuntScripts project.

---

## Shared Infrastructure

### `shared/tables/gen1_addresses.lua`
- **Created by:** PokemonHuntScripts (2026-11-11)
- **License:** MIT
- **Description:** Canonical Generation 1 memory map and version detector. Addresses
  cross-verified against `Real96/PokeLua` and `zep715/rbylua`. Provides a single
  `require()` source of truth so every Gen1 script can share the same version
  detection and address table.

---

## Gen1 — RBY (VBA-M)

### `tools/gen1/rby-vba/gift/giftbot.lua`
- **Original author:** zep715
- **Original repo:** <https://github.com/zep715/rbylua>
- **Fork maintainer:** Phosky71 (`https://github.com/Phosky71/rbylua`)
- **Original license:** None (upstream had no LICENSE file)
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** Replaced inline 25-line version-detection block with
  `require("shared.tables.gen1_addresses")`. Logic unchanged.

### `tools/gen1/rby-vba/stationary/stationarybot.lua`
- **Original author:** zep715
- **Original repo:** <https://github.com/zep715/rbylua>
- **Fork maintainer:** Phosky71
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** Replaced inline version-detection block with
  `require("shared.tables.gen1_addresses")`. Logic unchanged.

### `tools/gen1/rby-vba/fishing/fishbot.lua`
- **Original author:** zep715
- **Optimised by:** Phosky71
- **Original repo:** <https://github.com/zep715/rbylua> / <https://github.com/Phosky71/rbylua>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** None yet; scheduled for shared-table integration.

### `tools/gen1/rby-vba/fishing/autospecie_fishingbot.lua`
- **Original author:** LegoFigure11 (original), Phosky71 (upgrade)
- **Original repo:** <https://github.com/Phosky71/rbylua>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:**
  - **Fixed CRITICAL inverted shiny DV check** (0xA2 → 0x2A, etc.)
  - **Fixed inverted Spe/Spc labels** in print output
  - **Fixed duplicate `target == 128` branch** (Dewgong index corrected to 120)
  - **Added `local target_species = "Unknown"` declaration**

### `tools/gen1/rby-vba/in-game-trades/InGameTrade.lua`
- **Original author:** Phosky71
- **Original repo:** <https://github.com/Phosky71/rbylua>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:**
  - **Fixed uninitialised `input` table** (added `local input = {}`)
  - **Refactored 5 blocks of 30x repeated `emu.frameadvance()` into `for` loops**
    (287 lines → 135 lines, identical behavior)
  - **Fixed "spe/spe" → "spe/spc" label** in final print

### `tools/gen1/rby-vba/in-game-trades/LegoFigure11_igtbot.lua`
- **Original author:** zep715 (original), LegoFigure11 (optimised)
- **Original repo:** <https://github.com/Phosky71/rbylua>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:**
  - **Fixed CRITICAL inverted shiny DV check** (0xA2 → 0x2A, etc.)
  - **Fixed inverted Spe/Spc labels** in print output

### `tools/gen1/rby-vba/in-game-trades/Zep715_igtbot.lua`
- **Original author:** zep715
- **Original repo:** <https://github.com/zep715/rbylua>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** None yet.

### `tools/gen1/rby-vba/info/nature_checker.lua`
- **Original author:** Collector Togami (original), zep715 / Phosky71 (rewritten)
- **Original repo:** <https://github.com/Phosky71/rbylua>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** Restored from Phosky71's rbylua (was empty stub).

### `tools/gen1/rby-vba/info/tidbot.lua`
- **Original author:** zep715
- **Original repo:** <https://github.com/zep715/rbylua>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** Restored from Phosky71's rbylua (was empty stub).

### `tools/gen1/rby-vba/info/shiny_checker.lua`
- **Status:** Empty stub in original. No replacement found. Placeholder retained.

---

## Gen2 — GSC (VBA-M)

### `tools/gen2/gsc-vba/gsclua/` (full tree: 20 files)
- **Original author:** wwwwwwzx
- **Original repo:** <https://github.com/wwwwwwzx/gsclua>
- **Original license:** MIT
- **License here:** MIT (preserved — upstream LICENSE file included as `LICENSE-upstream-MIT`)
- **Scripts included:**
  - `Bots/c_suicune.lua` — Crystal Suicune stationary
  - `Bots/gsc_catch.lua` — Catch bot
  - `Bots/gsc_egg.lua` — Egg hatching
  - `Bots/gsc_gift.lua` — Gift resets
  - `Bots/gsc_stationary.lua` — Stationary encounters
  - `Bots/gsc_tid.lua` — TID hunting
  - `Bots/Wild/gsc_fish.lua` — Fishing
  - `Bots/Wild/gsc_headbutt.lua` — Headbutt trees
  - `Bots/Wild/gsc_holditem_search.lua` — Hold item search
  - `Bots/Wild/gsc_unown.lua` — Unown hunting
  - `Bots/Wild/gsc_wild.lua` — Wild encounters
  - `Bots/Wild/gsc_wild_legendary_beasts.lua` — Roaming legendary beasts
  - `RNG/Seed.lua` — RNG seed utility
  - `Viewer/gsc_DayCareView.lua` — Daycare viewer
  - `Viewer/gsc_PartyView.lua` — Party viewer
  - `Viewer/gsc_RoamerTracker.lua` — Roamer tracker
  - `Viewer/gsc_WildView.lua` — Wild encounter viewer
- **Modifications:** None (vendored verbatim).

### `tools/gen2/gsc-vba/phosky71/stationary/Crystal_Suicune.lua`
- **Original author:** Phosky71 (based on wwwwwwzx/gsclua c_suicune.lua)
- **Original repo:** <https://github.com/Phosky71/PokemonHuntScripts>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** None yet.

### `tools/gen2/gsc-vba/phosky71/wild/WildLegandaryBot.lua`
- **Original author:** Phosky71
- **Original repo:** <https://github.com/Phosky71/PokemonHuntScripts>
- **Original license:** None
- **License here:** MIT (applied by PokemonHuntScripts)
- **Modifications:** None yet.

---

## Upstream Repositories Investigated but NOT Integrated

These projects were analysed in detail. They are **not** copied into this repository
due to one or more of: incompatible license, no license, abandoned / broken,
or already superseded by a maintained fork.

| Repo | License | Reason not integrated |
|------|---------|----------------------|
| `Real96/PokeLua` (Gen1-5) | **GPL-3.0** | GPL-3.0 copyleft; see note below |
| `DevonStudios/LuaScripts` (Gen3-5) | **GPL-3.0** | GPL-3.0 copyleft + unmaintained (redirects to PokeLua) |
| `DBJoran/Shinyhunter` (Gen3 Python) | **None** | No license + outdated ML model (broken classifier) |
| `wyanido/pokebot-nds` (Gen4-5) | **MIT** | Archived; very comprehensive — considered for Phase 3 |
| `40Cakes/pokebot-gen3` (Gen3 Python) | **GPL-3.0** | GPL-3.0 copyleft; requires libmgba-py |
| `NicolasAvilaB/LuaScripts` | **GPL-3.0** | Fork of DevonStudios (minor diffs) |
| `MichiS97/rselua` (Gen3) | **None** | No license |
| `kvpb/luascripts` | **None** | No license; mostly dupes of zep715/rbylua |
| `kvpb/PKMNLuaScripts` (Gen1) | **None** | No license; mostly empty submodules |
| `Phosky71/AutoShinyHunterAllGens` | **None** | No license; early draft (PyQt UI unimplemented) |

### GPL-3.0 Integration Note

`Real96/PokeLua` and `DevonStudios/LuaScripts` together cover Gen1-5 across VBA,
mGBA, BizHawk, DeSmuME, and Dolphin — by far the most comprehensive and actively
maintained Lua RNG toolset. They are under GPL-3.0.

GPL-3.0 requires that the resulting combined work be distributed under GPL-3.0.
If the PokemonHuntScripts project adopts GPL-3.0 as its repository license,
these tools can be vendored and improved. This is **recommended** as a future
step — see `PROJECT_AUDIT.md`.
