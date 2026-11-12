# Suite GSC Lua Gen 2 (gsclua)

## 1. Nombre y Descripción
- **Suite:** `gsclua` por `wwwwwwzx`.
- **Descripción:** Colección completa de scripts Lua para Pokémon Oro, Plata y Cristal que cubre几乎 todos los métodos de caza shiny en Generación 2.

## 2. Funcionalidad
La suite se divide en **Bots** (automatización) y **Visores** (visualización de datos en tiempo real).

### Bots
- **`gsc_wild.lua`**: Automатiza encuentros en hierba/cuevas. Camina hasta encontrar un Pokémon, verifica DVs y pausa/reinicia.
- **`gsc_stationary.lua`**: Automатiza encuentros estáticos (Lugia, Ho-Oh, Celebi, Sudowoodo). Guarda estado frente al Pokémon.
- **`c_suicune.lua`**: Bot especializado para Suicune de la Torre del Cielo.
- **`gsc_gift.lua`**: Automатiza regalos (Iniciales, Eevee, Shuckle, Tyrogue). Guarda antes del último A.
- **`gsc_egg.lua`**: Automаtiza eclosión de huevos. Ejecutar después de recoger el huevo del Centro Día.
- **`gsc_tid.lua`**: Busca TID específico. Ejecutar en pantalla "New Game".
- **`gsc_fish.lua`**: Pesca automatizada. Destacar "USE" en la caña del inventario.
- **`gsc_headbutt.lua`**: Automатiza árboles cabeceables.
- **`gsc_unown.lua`**: Especializado para letras específicas de Unown (A-Z).
- **`gsc_wild_legendary_beasts.lua`**: Caza y captura de bestias legendarias errantes (Raikou, Entei, Suicune).
- **`gsc_catch.lua`**: Lanza Poké Balls automáticamente y reinicia si falla.
- **`gsc_holditem_search.lua`**: Busca items específicos en Pokémon salvajes (ej. Lucky Egg).

### Visores
- **`gsc_WildView.lua`**: Muestra DVs, HP e item de encuentros salvajes.
- **`gsc_PartyView.lua`**: Estado del equipo.
- **`gsc_DayCareView.lua`**: Estado del Centro Día.
- **`gsc_RoamerTracker.lua`**: Sigue a las bestias errantes (DVs y ubicación actual).

## 3. Juegos Soportados
- Pokémon Oro, Plata y Cristal (JPN, USA, EUR, KOR).

## 4. Emulador Requerido
- VBA-M rr 23.6.

## 5. Créditos
- Autor original: `wwwwwwzx`.
- Contribuidores: `zep715`, `Real96`, `Sipanale`.
- Licencia: MIT.
