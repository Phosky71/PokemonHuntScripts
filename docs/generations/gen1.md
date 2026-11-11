# Generation 1 — RBY (Red, Blue, Yellow)

## Games Covered
- Pokémon Red (JPN, USA, EUR)
- Pokémon Blue (JPN, USA, EUR)
- Pokémon Yellow (JPN, USA, EUR)
- Pokémon Green (Japan only)

## Available Methods

### Shiny Hunting
| Method | Script | Notes |
|--------|--------|-------|
| Gift / Starter | `giftbot.lua` | Starters, fossils, Eevee, Lapras, prizes |
| Fishing | `fishbot.lua` | Manual species index target |
| Fishing (Auto) | `autospecie_fishingbot.lua` | First fishable species encountered |
| Stationary | `stationarybot.lua` | Snorlax, ZAPDOS, Articuno, Moltres, Mewtwo |
| In-Game Trades | `InGameTrade.lua`, `LegoFigure11_igtbot.lua` | NPC trades |

### Information Tools
| Tool | Purpose |
|------|---------|
| `nature_checker.lua` | Displays DVs and Nature of party Pokémon on-screen |
| `tidbot.lua` | Hunts for specific Trainer ID values |
| `shiny_checker.lua` | Stub; no functionality implemented |

## Memory Addresses
All Gen 1 scripts rely on shared memory tables in `shared/tables/gen1_addresses.lua`. The central addresses are:

- **Version Check:** Word at `0x14E`
- **Enemy DV Address:** Varies by game region (e.g., `0xCFF1` for USA Red/Blue, `0xCFD8` for Japan)
- **Party Slot Base:** `entry.slots` from gen1_addresses module
- **Battle Flag:** `0xC027` (used to detect encounter start)

## Shiny Criteria
Gen 1 shininess is determined solely by the Pokémon's DVs (Individual Values):
- **Special/Speed byte (`spespc`):** Must equal `0xAA` (hex) = 170 decimal
- **Attack/Defense byte (`atkdef`):** Must be one of `{0x2A, 0x3A, 0x6A, 0x7A, 0xAA, 0xBA, 0xEA, 0xFA}`

This means:
- Defense must have value 10
- Speed must have value 10
- Special must have value 10
- Attack must have value 2, 3, 6, 7, 10, 11, 14, or 15

## Emulator
- **Only supported emulator:** VisualBoyAdvance-M rr 23.6
- Other emulators (mGBA, BizHawk, DeSmuME) require significant API translation as these scripts use the VBA-M Lua API (`memory.readbyte`, `joypad.set(1, ...)`).

## Notes & Limitations
- Scripts do not currently support speed-up features; always run at normal emulator speed.
- European ROMs contain multiple language variants (EN, FR, DE, ES); some share identical memory layouts while others differ.
