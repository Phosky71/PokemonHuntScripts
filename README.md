# PokemonHuntScripts

> A curated, audited, and improved collection of shiny-hunting scripts and tools for Pokémon games.
> **Original repo:** <https://github.com/Phosky71/PokemonHuntScripts>
> **This repo:** maintained fork — all original work is preserved and credited.

## Idioma / Language
- **English** (predeterminado) — this file
- **Español** — <https://github.com/Phosky71/PokemonHuntScripts/blob/main/docs/es/README.md>

## What is this?

PokemonHuntScripts is a technical reference and toolkit for automated shiny hunting across Pokémon generations. It is **not** a copy-paste dump: every tool included here has been

1. Audited for correctness (memory addresses, DV checks, RNG logic).
2. Checked for license compatibility before integration.
3. Fixed where a verifiable bug exists.
4. Documented with a per-tool fact sheet.

## Repository structure

```
PokemonHuntScripts/
├── README.md                  # this file
├── LICENSE                    # repository-level license (see below)
├── CREDITS.md                 # attribution for every integrated tool
├── CONTRIBUTING.md
├── SECURITY.md
├── PROJECT_AUDIT.md           # full audit report
├── docs/
│   ├── architecture/          # architecture decisions
│   ├── generations/           # per-generation notes
│   ├── emulators/             # emulator compatibility matrix
│   ├── guides/                # user guides
│   └── development/           # developer notes
├── catalog/                   # machine-readable catalog
│   ├── tools/                 # one JSON per tool
│   ├── games/                 # game definitions
│   └── compatibility/         # compatibility matrix
├── tools/                     # actual scripts, organized by generation
│   ├── gen1/                  # RBY  (VBA-M)
│   ├── gen2/                  # GSC  (VBA-M)
│   ├── gen3/                  # RSE/FRLG/E (mGBA, Dolphin, VBA, BizHawk)
│   ├── gen4/                  # DPPt/HGSS (DeSmuME, BizHawk)
│   ├── gen5/                   # BW/B2W2 (DeSmuME, BizHawk)
│   └── general/               # cross-cutting utilities
└── shared/                    # shared Lua modules
```

## How to use this repo

1. Pick a generation folder under `tools/`.
2. Read the per-tool `.md` file (same name as the script) for install + usage.
3. Follow the emulator instructions in `docs/emulators/`.

## License

This repository is licensed under **MIT**. Individual tools retain their original licenses; see `CREDITS.md` and each tool's folder for details. GPL-3.0 tools are included under the terms of the GPL-3.0 and remain so.

## Contributing

See `CONTRIBUTING.md`. All commits require a code gate (tests + audit) before being accepted.