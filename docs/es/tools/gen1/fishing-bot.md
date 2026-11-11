# Bots de Pesca Gen1 (`fishbot.lua` y `autospecie_fishingbot.lua`)

## 1. Nombre y Descripción
- **Herramientas:** `fishbot.lua` (objetivo manual por índice) y `autospecie_fishingbot.lua` (caza automatizada de la primera especie).
- **Descripción:** Scripts de Lua automatizados para VBA-M que ejecutan juegos de la Generación 1 (Rojo, Azul, Amarillo, Verde JPN) para pescar, comprobar DVs según el criterio shiny de Gen 1, realizar soft-reset si no es shiny y detenerse al encontrar uno.

## 2. Funcionalidad
- **`fishbot.lua`:** Requiere que el usuario edite `local target = <index>` con el número de índice de la Generación 1 del Pokémon deseado. El bot lanza la caña, lee la bandera de picada en `0xCD3D`, verifica si la especie coincide con `target`, espera el diálogo, lee los DVs y reinicia si no es shiny.
- **`autospecie_fishingbot.lua`:** Lee automáticamente la especie pescada de la memoria, la traduce a un nombre legible mediante una cadena de comprobaciones (soporta 27 especies) y caza esa especie hasta encontrar un shiny.

## 3. Pokémon y Juegos Soportados
- **Juegos:** Pokémon Rojo, Azul, Amarillo y Verde (Japón, USA, Europa).
- **Pokémon:** Cualquier Pokémon pescable en Gen 1 (Magikarp, Poliwag, Horsea, Dratini, Omanyte, Gyarados, Tentacool, etc.).

## 4. Generación
- Generación 1 (RBY).

## 5. Emulador Requerido
- **VisualBoyAdvance-M (VBA-M)** — específicamente la versión **vba rr 23.6**.

## 6. Versiones de Emulador Probadas
- VBA-M rr 23.6 (Verificado).

## 7. Requisitos Previos
- VBA-M rr 23.6 con una ROM de Gen 1 soportada.
- Una caña de pescar (Vieja, Buena o Supercaña) en la mochila.
- Personaje frente al agua.
- Cursor sobre **`USAR`** (USE) en el menú de objetos.

## 8. Dependencias
- Ninguna para `fishbot.lua`.
- `autospecie_fishingbot.lua` depende de las APIs de memoria de VBA-M.

## 9. Instalación
1. Colocar los archivos en `tools/gen1/rby-vba/fishing/`.
2. Abrir VBA-M rr 23.6 y cargar la ROM.

## 10. Configuración
- Para `fishbot.lua`: Editar el script y poner el índice en `local target = <index>`.
- Para `autospecie_fishingbot.lua`: Sin configuración necesaria.

## 11. Instrucciones de Ejecución Paso a Paso
1. En el juego, resalta la caña y pon el cursor en **`USAR`**.
2. En VBA-M: **Tools → Lua Scripting → New Lua Script Window**.
3. Selecciona el script y pulsa **Run**.
4. El bot hará todo el proceso automáticamente.

## 12. Parámetros Configurables
- `target`: Índice de especie (`fishbot.lua`).

## 13. Controles Disponibles
- Automatizado mediante el joypad 1.

## 14. Funcionamiento Interno (RNG / DVs)
- **Criterio Shiny:** Evalúa si `spespc == 0xAA` y si `atkdef` está en los valores válidos (Ataque 2, 3, 6, 7, 10, 11, 14 o 15; Defensa, Velocidad y Especial 10).

## 15. Resultado Esperado
- El log mostrará el progreso y se detendrá con el mensaje `"Shiny found!!!"`.

## 16. Solución de Problemas
- Si no pesca, verifica que el personaje está mirando al agua.
- Si se detiene al inicio, la versión de la ROM podría no estar soportada.

## 17. Limitaciones Conocidas
- Exclusivo para VBA-M rr 23.6.

## 18. Autoría y Créditos
- **`fishbot.lua`:** zep715, optimizado por Phosky71.
- **`autospecie_fishingbot.lua`:** LegoFigure11, mejorado por Phosky71 (corrección de errores críticos).

## 19. Licencia
- **MIT** (aplicada por PokemonHuntScripts).

## 20. Historial de Modificaciones
- Corregida lógica de comprobación de DVs invertida.
- Corregidas etiquetas Spe/Spc.
- Corregido índice de Dewgong (120).
