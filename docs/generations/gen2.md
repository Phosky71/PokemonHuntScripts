# Generation 2 — GSC (Gold, Silver, Crystal)

## Games Covered
- Pokémon Gold (JPN, USA, EUR, KOR)
- Pokémon Silver (JPN, USA, EUR, KOR)
- Pokémon Crystal (JPN, USA, EUR)

## Available Methods

### Shiny Hunting (gsclua Suite)
| Method | Script | Notes |
|--------|--------|-------|
| Wild | `gsc_wild.lua` | Standard grass/cave hunting |
| Stationary | `gsc_stationary.lua` | Lugia, Ho-Oh, Celebi, Sudowoodo |
| Gift | `gsc_gift.lua` | Starters, Eevee, Shuckle, Tyrogue |
| Egg | `gsc_egg.lua` | Egg hatching automation |
| Fishing | `gsc_fish.lua` | Automated rod casting |
| Roaming Beasts | `gsc_wild_legendary_beasts.lua` | Specialized hunt for Raikou, Entei, Suicune |

### Specialized & Optimized (Phosky71)
| Tool | Purpose |
|------|---------|
| `Crystal_Suicune.lua` | Optimized Tin Tower Suicune (Crystal) |
| `WildLegandaryBot.lua` | High-efficiency roaming hunt (Ecruteak transition) |

### Information Tools
| Tool | Purpose |
|------|---------|
| `gsc_WildView.lua` | DV, HP, and Item viewer for wild encounters |
| `gsc_PartyView.lua` | Party data display |
| `gsc_DayCareView.lua` | Day Care data display |
| `gsc_RoamerTracker.lua` | Tracking roamers (DVs and current map) |

## Memory Addresses
Gen 2 detection is more complex due to multiple regions.
- **Version ID:** `0x141`
- **Region ID:** `0x142`
- **Enemy DV Address:**
  - USA/EUR Crystal: `0xD20C`
  - Japan Crystal: `0xD23D`
  - USA/EUR G/S: `0xD0F5`
  - Japan G/S: `0xD0E7`
  - Korea G/S: `0xD1B2`

## Shiny Criteria
Gen 2 uses the same shiny criteria as Gen 1 (determined by DVs).
- **Special/Speed byte (`spespc`):** `0xAA`
- **Attack/Defense byte (`atkdef`):** `0x2A`, `0x3A`, `0x6A`, `0x7A`, `0xAA`, `0xBA`, `0xEA`, `0xFA`

## Emulator
- **Only supported emulator:** VisualBoyAdvance-M rr 23.6

## Notes & Limitations
- Roaming Beasts DVs are set when they are first released. Hunting them requires the bot to encounter them and check their DVs.
- Egg DVs are set when the egg is generated.
