# Generación 1 — RBY (Rojo, Azul, Amarillo)

## Juegos
- Rojo, Azul, Amarillo (JPN, USA, EUR) y Verde (JPN).

## Métodos Disponibles
| Método | Script | Notas |
|--------|--------|-------|
| Regalos / Starters | `giftbot.lua` | Iniciales, fósiles, Eevee |
| Pesca | `fishbot.lua` | Especie manual |
| Pesca Auto | `autospecie_fishingbot.lua` | Primera especie pescada |
| Estacionarios | `stationarybot.lua` | Snorlax, Legendaries |
| Trueques | `InGameTrade.lua` | NPCs |

## Herramientas de Información
- `nature_checker.lua`: Muestra Nature y estado shiny en pantalla.
- `tidbot.lua`: Busca TID deseado.

## Criterio Shiny
Un Pokémon es shiny si:
- **Byte Spc/Spe:** es `0xAA` (170 decimal)
- **Byte Atk/Def:** es uno de `{0x2A, 0x3A, 0x6A, 0x7A, 0xAA, 0xBA, 0xEA, 0xFA}`
- Equivalente: Defensa=10, Velocidad=10, Especial=10; Ataque ∈ {2, 3, 6, 7, 10, 11, 14, 15}

## Emulador
- Solo soportado: VBA-M rr 23.6.

## Limitaciones
- No usar aceleradores de velocidad (speed-up), causan fallos de sincronía.
