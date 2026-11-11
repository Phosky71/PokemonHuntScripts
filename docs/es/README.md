# PokemonHuntScripts

> Una colección curada, auditada y mejorada de scripts y herramientas de caza de shiny para juegos de Pokémon.
> **Repositorio original:** <https://github.com/Phosky71/PokemonHuntScripts>
> **Este repositorio:** es un fork mantenido — todo el trabajo original se preserva y se atribuye.

## Idioma / Language
- **Español** (este archivo)
- **Inglés** (predeterminado) — <https://github.com/Phosky71/PokemonHuntScripts/blob/main/README.md>

## ¿Qué es esto?

PokemonHuntScripts es una referencia técnica y un conjunto de herramientas para la caza automatizada de Pokémon shiny a lo largo de las generaciones. **No** es un simple copia y pega: cada herramienta incluida aquí ha sido:

1. Auditada por su corrección (direcciones de memoria, comprobaciones DV, lógica RNG).
2. Comprobada por compatibilidad de licencias antes de la integración.
3. Corregida donde se encontró un error verificable.
4. Documentada con una ficha técnica por herramienta.

## Estructura del repositorio

```
PokemonHuntScripts/
├── README.md                  # este archivo
├── LICENSE                    # licencia del repositorio (ver más abajo)
├── CREDITS.md                 # atribución para cada herramienta integrada
├── CONTRIBUTING.md
├── SECURITY.md
├── PROJECT_AUDIT.md           # informe completo de auditoría
├── docs/
│   ├── es/                    # documentación en español
│   ├── arquitectura/          # decisiones de diseño
│   ├── generaciones/           # notas por generación
│   ├── emuladores/             # matriz de compatibilidad de emuladores
│   └── guías/                  # guías de usuario
├── catalog/                   # catálogo legible por máquina
│   ├── herramientas/          # un JSON por herramienta
│   ├── juegos/                # definiciones de juegos
│   └── compatibilidad/        # matriz de compatibilidad
├── herramientas/               # scripts reales, organizados por generación
│   ├── gen1/                  # RBY (VBA-M)
│   ├── gen2/                  # GSC (VBA-M)
│   ├── gen3/                  # RSE/FRLG/E (mGBA, Dolphin, VBA, BizHawk)
│   ├── gen4/                  # DPPt/HGSS (DeSmuME, BizHawk)
│   ├── gen5/                   # BW/B2W2 (DeSmuME, BizHawk)
│   └── general/               # utilidades transversales
└── compartido/                 # módulos Lua compartidos
```

## Cómo usar este repositorio

1. Selecciona una carpeta de generación dentro de `herramientas/`.
2. Lee el archivo `.md` correspondiente a cada herramienta (mismo nombre que el script) para instalación y uso.
3. Sigue las instrucciones del emulador en `docs/emuladores/`.

## Licencia

Este repositorio está licenciado bajo **MIT**. Las herramientas individuales conservan sus licencias originales; ver `CREDITS.md` y la carpeta de cada herramienta para detalles. Las herramientas GPL-3.0 se incluyen bajo los términos de GPL-3.0 y así permanecen.

## Contribuir

Ver `CONTRIBUTING.md`. Todos los commits requieren un **gate de código** (pruebas + auditoría) antes de ser aceptados.