# Mecánicas Técnicas — Generación 1 y Generación 2

## 1. Visión General y Alcance
Este documento proporciona una explicación técnica de las mecánicas de juego, estructuras de RAM, comportamiento de RNG y fórmulas de DVs utilizadas por los scripts de Lua en **PokemonHuntScripts**. Cubre la Generación 1 (Pokémon Rojo, Azul, Amarillo, Verde) y la Generación 2 (Pokémon Oro, Plata, Cristal).

---

## 2. Determinación de Pokémon Shiny

En la Generación 1 y 2, la condición de Shiny se determina **exclusivamente mediante DVs (Valores Determinantes)**. No existen comprobaciones de PID ni XOR de TID/SID como en la Gen 3+.

### Estructura de Datos de DVs
En la Memoria RAM, los DVs de un Pokémon se almacenan en 2 bytes consecutivos (16 bits en total):
- **Byte 1 (`atkdef`):** Nibble alto = DV de Ataque (0–15), Nibble bajo = DV de Defensa (0–15).
- **Byte 2 (`spespc`):** Nibble alto = DV de Velocidad (0–15), Nibble bajo = DV de Especial (0–15).
- **DV de PS (HP):** Se calcula de forma implícita a partir del bit menos significativo de los otros cuatro DVs:
  $$\text{DV PS} = 8 \times (\text{Atk} \bmod 2) + 4 \times (\text{Def} \bmod 2) + 2 \times (\text{Spe} \bmod 2) + 1 \times (\text{Spc} \bmod 2)$$

### Criterio Shiny
Un Pokémon es Shiny si y solo si:
1. **DV de Defensa** = 10 (`0xA`)
2. **DV de Velocidad** = 10 (`0xA`)
3. **DV de Especial** = 10 (`0xA`)
4. **DV de Ataque** $\in \{2, 3, 6, 7, 10, 11, 14, 15\}$ (es decir, binario `0x2`, `0x3`, `0x6`, `0x7`, `0xA`, `0xB`, `0xE`, `0xF`)

### Fórmula de Valores Hexadecimales en Memoria
- **Byte `spespc`:** Debe ser exactamente `0xAA` (Velocidad = 10, Especial = 10).
- **Byte `atkdef`:** Debe ser uno de `{0x2A, 0x3A, 0x6A, 0x7A, 0xAA, 0xBA, 0xEA, 0xFA}`.

### Probabilidad
$$\text{Probabilidad} = \frac{8 \text{ DVs de Ataque válidos}}{16 \times 16 \times 16 \times 16} = \frac{8}{65.536} = \frac{1}{8.192}$$

---

## 3. Naturalezas Virtuales (Conversión Poké Trasladador Gen 1)
La Generación 1 no tiene Naturalezas de forma nativa. Sin embargo, al transferir a Gen 7/8 mediante el Poké Trasladador, la Naturaleza se asigna de forma determinista:
$$\text{Índice de Naturaleza} = \text{Puntos de Exp Totales} \bmod 25$$

`nature_checker.lua` calcula este valor dinámicamente en RAM para permitir a los jugadores buscar Naturalezas específicas en Gen 1 antes de transferir.

---

## 4. Direcciones de Memoria RAM

### Mapa de Memoria Gen 1 (VBA-M)
- **Checksum de Cabecera:** `0x014E` (Word) — Utilizado para detección automática de versión.
- **Flag de Batalla:** `0xC027` — Alcanza `0xF0` al iniciar la secuencia de combate.
- **Flag de Picada de Pesca:** `0xCD3D` — `0x01` = Pescó algo, `0x02` = Sin picada, `0x00` = Mordisco en curso.
- **Dirección de DVs Enemigos:**
  - JPN Red/Green/Blue/Yellow: `0xCFD8`
  - USA Red/Blue: `0xCFF1`
  - USA Yellow: `0xCFF0`
  - EUR Red/Blue: `0xCFF6`
  - EUR Yellow: `0xCFF5`

### Mapa de Memoria Gen 2 (VBA-M)
- **ID de Versión:** `0x0141` (`0x54` = Cristal, `0x55` = Oro, `0x58` = Plata)
- **ID de Región:** `0x0142` (`0x44`/`0x45`/`0x4A`/`0x4B`/`0x53`)
- **Dirección de DVs Enemigos (`enemy_addr`):**
  - USA/EUR Cristal: `0xD20C`
  - JPN Cristal: `0xD23D`
  - USA/EUR Oro/Plata: `0xD0F5`
  - JPN Oro/Plata: `0xD0E7`
  - KOR Oro/Plata: `0xD1B2`

---

## 5. Mecánicas de Temporización y Cuadros (Frames)
- **Tasa de Refresco:** Game Boy / Game Boy Color funciona a ~59,73 Hz.
- **Soft-Resetting:** Se realiza guardando un estado de emulador (`savestate.save`) antes del encuentro y recargándolo (`savestate.load`) si los DVs no son shiny.
- **Automatización de Diálogos:** Los bucles de entrada (`joypad.set(1, {A = true})` junto con `emu.frameadvance()`) avanzan texto sin desincronizar el emulador.
