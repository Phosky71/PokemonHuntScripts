# Bot de Regalos y Starters Gen1 (`giftbot.lua`)

## 1. Nombre y Descripción
- **Herramienta:** `giftbot.lua`
- **Descripción:** Script de Lua para VBA-M diseñado para buscar Pokémon shiny entregados como regalo, iniciales (starters), fósiles o premios en la Generación 1.

## 2. Funcionalidad
- Detecta la versión del juego, navega los diálogos automáticamente, recibe al Pokémon, comprueba sus DVs y reinicia si no es shiny.

## 3. Pokémon y Juegos Soportados
- **Juegos:** Rojo, Azul, Amarillo, Verde (Todas las regiones).
- **Objetivos:** Iniciales (Bulbasaur, Charmander, Squirtle), Fósiles, Eevee, Lapras, premios del Casino.

## 4. Generación
- Generación 1 (RBY).

## 5. Emulador Requerido
- VBA-M rr 23.6.

## 6. Versiones de Emulador Probadas
- VBA-M rr 23.6 (Verificado).

## 7. Requisitos Previos
- Guardar estado (Save state) justo antes de recibir el Pokémon (en el último cuadro de diálogo).

## 8. Dependencias
- `shared.tables.gen1_addresses.lua`

## 9. Instalación
- `tools/gen1/rby-vba/gift/giftbot.lua`.

## 10. Configuración
- Estar frente al NPC o Poké Ball del regalo.

## 11. Instrucciones de Ejecución Paso a Paso
1. Cargar el estado guardado previo al regalo.
2. Ejecutar `giftbot.lua` en la ventana de Lua de VBA-M.
3. El bot recibirá al Pokémon y reiniciará hasta que sea shiny.

## 12. Parámetros Configurables
- Ninguno necesario.

## 13. Controles Disponibles
- Automatizado (Joypad 1).

## 14. Funcionamiento Interno
- Utiliza la tabla compartida de direcciones para calcular el offset del slot de equipo y leer los DVs.

## 15. Resultado Esperado
- El script se detiene al encontrar el shiny y muestra los DVs en la consola.

## 16. Solución de Problemas
- Asegúrate de que el estado guardado no sea demasiado tarde (después de que se generen los DVs).

## 17. Limitaciones Conocidas
- Exclusivo de VBA-M rr 23.6.

## 18. Autoría y Créditos
- **Autor original:** zep715.
- **Mantenedor:** Phosky71.

## 19. Licencia
- **MIT**.

## 20. Historial de Modificaciones
- Refactorizado para usar la tabla de direcciones unificada.
