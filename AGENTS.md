# Reglas de Agentes — PokemonHuntScripts

## 🛑 REGLA ABSOLUTA DE SEGURIDAD PRE-COMMIT
Queda terminantemente prohibido ejecutar `git commit` o `git push` sin haber ejecutado previamente `operia-code-gate` (que orquesta `operia-test-destroyer` y `operia-diff-auditor`) sobre los cambios actuales. Si detectas la intención de commitear, intercepta la acción, ejecuta el gate, muestra el semáforo y espera confirmación explícita.

## 💰 PROTOCOLO DE AHORRO DE TOKENS (MODELOS DE PAGO / CUOTAS LIMITADAS)
Si estás ejecutando sobre un modelo comercial de pago, endpoint tarifado por tokens o el usuario solicita optimización de consumo, activa y cumple estrictamente las directivas de `operia-token-saver`: cero relleno conversacional, lecturas de código quirúrgicas mediante rangos de líneas o búsquedas dirigidas (PowerShell `Select-String` / Git Bash `grep`, prohibido volcar archivos >150 líneas) y modificaciones atómicas vía diff.

## 💻 GUÍA DE COMANDOS COMPATIBLES (POWERSHELL 5.1 / 7 Y GIT BASH)
Al inspeccionar archivos o filtrar salidas en Windows, utiliza siempre comandos compatibles según la shell activa:
- Búsqueda en archivo: `Select-String -Path .\archivo -Pattern "texto"` (PowerShell) o `grep -n "texto" archivo` (Git Bash).
- Filtrar logs por tubería: `git status | Select-String "modified"` (PowerShell) o `git status | grep "modified"` (Git Bash).
- Primeras N líneas: `Get-Content .\archivo -TotalCount N` o `| Select-Object -First N` (PowerShell) / `head -n N archivo` (Git Bash).
- Últimas N líneas: `Get-Content .\archivo -Tail N` o `| Select-Object -Last N` (PowerShell) / `tail -n N archivo` (Git Bash).
- Comprobar existencia: `Test-Path .\ruta\archivo` (PowerShell) / `test -f ruta/archivo` (Git Bash).

## 🌐 POLÍTICA DE DOCUMENTACIÓN BILINGÜE
1. Toda documentación nueva debe redactarse primero en inglés.
2. Todo documento técnico público debe tener traducción española cuando sea relevante para los usuarios.
3. Los cambios en un documento inglés deben reflejarse en su traducción española (`docs/es/`).
4. No se permite que ambas versiones tengan información técnica contradictoria.
5. Los ejemplos de código, comandos, rutas y nombres de archivos deben permanecer idénticos entre idiomas.
6. Los términos técnicos pueden conservarse en inglés cuando su traducción resulte confusa.
7. Los nombres de herramientas, proyectos y tecnologías nunca deben traducirse.
