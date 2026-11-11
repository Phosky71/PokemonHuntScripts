# Bots de Trueque Gen1 (`InGameTrade`, `LegoFigure11_igtbot`, `Zep715_igtbot`)

## 1. Nombre y Descripción
- Scripts para buscar shiny en los trueques de NPC (Intercambio en Juego).

## 2. Scripts Disponibles
- **`InGameTrade.lua`:** Recomendado. Más moderno y estable.
- **`LegoFigure11_igtbot.lua`:** Optimizado, cuenta soft-resets.
- **`Zep715_igtbot.lua`:** Versión original básica.

## 3. Instrucciones de Uso
1. Inicia el trueque con el NPC.
2. Guarda estado justo antes del final de la animación.
3. Ejecuta el script.

## 4. Correciones Aplicadas
- Se arregló una tabla `input` no inicializada que causaba error.
- Se optimizó el bucle de `frameadvance()` (reducción de ~50 líneas a 5 bucles for).
- Arreglo crítico de lógica de DVs invertidos en `LegoFigure11_igtbot.lua`.

## 5. Autoría
- `InGameTrade.lua`: Phosky71.
- `LegoFigure11_igtbot.lua`: LegoFigure11.
- `Zep715_igtbot.lua`: zep715.
