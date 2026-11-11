# Generación 2 — GSC (Oro, Plata, Cristal)

## Juegos Cubiertos
- Pokémon Oro, Plata y Cristal (JPN, USA, EUR, KOR).

## Métodos de Shiny Hunting Disponibles
| Método | Script | Notas |
|--------|--------|-------|
| Salvaje | `gsc_wild.lua` | Hierba/cuevas |
| Estacionarios | `gsc_stationary.lua` | Lugia, Ho-Oh, Celebi |
| Regalos | `gsc_gift.lua` | Iniciales, Eevee, Shuckle |
| Huevos | `gsc_egg.lua` | Centro Día |
| Pesca | `gsc_fish.lua` | Automatizada |
| Bestias Errantes | `gsc_wild_legendary_beasts.lua` | Raikou, Entei, Suicune |

## Herramientas Especializadas (Phosky71)
- `Crystal_Suicune.lua`: Optimizado para Suicune en la Torre del Cielito.
- `WildLegandaryBot.lua`: Caza avanzada de bestias errantes.

## Visores de Información
- `gsc_WildView.lua`: DVs, HP y objeto en vivo.
- `gsc_PartyView.lua`: Estado del equipo.
- `gsc_DayCareView.lua`: Estado del Centro Día.
- `gsc_RoamerTracker.lua`: Seguimiento de bestias errantes.

## Emulador Compatible
- **VisualBoyAdvance-M (VBA-M)** versión **rr 23.6** es el único soportado oficialmente.

## Diferencias Técnicas Importantes
- Las memorias son diferentes entre Crystal y Oro/Plata (variantes de región).
- La detección de región usa los bytes en `0x141` (versión) y `0x142` (región).
- No todas las especies tienen presencia en todos los juegos.

## Limitaciones de las Herramientas
- Exclusivo para VBA-M rr 23.6.
- Las bestias errantes pueden requerir estrategias específicas de localización.

## Enlaces a Guías Individuales
- [gsclua](../../tools/gen2/gsclua.md)
- [Phosky71 scripts](../../tools/gen2/phosky71.md)
