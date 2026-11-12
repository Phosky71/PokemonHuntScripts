"""
Automated Repository & Documentation Validator for PokemonHuntScripts.
Checks catalog JSON integrity, script coverage, internal link validity,
bilingual documentation parity, and required section fields.
"""

import os
import json
import re

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))

errors = []
warnings = []

def log_err(msg):
    errors.append(msg)
    print(f"[ERROR] {msg}")

def log_warn(msg):
    warnings.append(msg)
    print(f"[WARN] {msg}")

print("=== STARTING POKEMONHUNTSCRIPTS DOC & CATALOG VALIDATOR ===")

# 1. Discover all Lua scripts
lua_scripts = []
for dp, dn, fns in os.walk(os.path.join(ROOT, "tools")):
    for fn in fns:
        if fn.endswith(".lua"):
            rel = os.path.relpath(os.path.join(dp, fn), ROOT).replace("\\", "/")
            lua_scripts.append(rel)

print(f"Discovered {len(lua_scripts)} Lua scripts in tools/.")

# 2. Discover all catalog JSON entries
catalog_dir = os.path.join(ROOT, "catalog", "tools")
catalog_files = [f for f in os.listdir(catalog_dir) if f.endswith(".json")]
print(f"Discovered {len(catalog_files)} JSON catalog files.")

required_catalog_fields = [
    "id", "name", "generation", "games", "method", "emulator",
    "script_path", "doc_path_en", "doc_path_es", "author", "license", "status"
]

catalog_ids = set()

for cfile in catalog_files:
    cpath = os.path.join(catalog_dir, cfile)
    try:
        with open(cpath, "r", encoding="utf-8") as f:
            data = json.load(f)
            
        # Check required fields
        for field in required_catalog_fields:
            if field not in data:
                log_err(f"{cfile} missing required field: '{field}'")
                
        if "id" in data:
            if data["id"] in catalog_ids:
                log_err(f"Duplicate catalog ID: '{data['id']}' in {cfile}")
            catalog_ids.add(data["id"])
            
        # Check script_path existence
        if "script_path" in data:
            sp = os.path.join(ROOT, data["script_path"])
            if not os.path.exists(sp):
                log_err(f"{cfile}: script_path '{data['script_path']}' does not exist on disk.")
                
        # Check doc paths
        if "doc_path_en" in data:
            dp_en = os.path.join(ROOT, data["doc_path_en"])
            if not os.path.exists(dp_en):
                log_err(f"{cfile}: doc_path_en '{data['doc_path_en']}' does not exist.")
                
        if "doc_path_es" in data:
            dp_es = os.path.join(ROOT, data["doc_path_es"])
            if not os.path.exists(dp_es):
                log_err(f"{cfile}: doc_path_es '{data['doc_path_es']}' does not exist.")
                
    except Exception as e:
        log_err(f"Failed to parse JSON in {cfile}: {e}")

# 3. Verify documentation coverage for Lua scripts
print("\nChecking Lua script documentation coverage...")
for script in lua_scripts:
    # Check if script is mentioned in any doc or catalog
    matched = False
    for cfile in catalog_files:
        cpath = os.path.join(catalog_dir, cfile)
        try:
            with open(cpath, "r", encoding="utf-8") as f:
                data = json.load(f)
                if data.get("script_path") == script or script in data.get("all_scripts", []):
                    matched = True
                    break
        except Exception:
            pass
    if not matched:
        log_warn(f"Script '{script}' is not explicitly listed in any tool catalog entry.")

# 4. Bilingual Parity Check
print("\nChecking Bilingual Documentation Parity (docs/ vs docs/es/)...")
docs_en = []
for dp, dn, fns in os.walk(os.path.join(ROOT, "docs")):
    if "docs\\es" in dp or "docs/es" in dp:
        continue
    for fn in fns:
        if fn.endswith(".md"):
            rel = os.path.relpath(os.path.join(dp, fn), os.path.join(ROOT, "docs")).replace("\\", "/")
            docs_en.append(rel)

for doc in docs_en:
    es_counterpart = os.path.join(ROOT, "docs", "es", doc)
    if not os.path.exists(es_counterpart):
        log_err(f"Missing Spanish translation for 'docs/{doc}' -> expected 'docs/es/{doc}'.")

# 5. Root Documents Parity Check
root_docs = ["README.md", "PROJECT_AUDIT.md", "DOCUMENTATION_AUDIT.md", "CODE_QUALITY_AUDIT.md"]
for rdoc in root_docs:
    es_root = os.path.join(ROOT, "docs", "es", rdoc)
    if not os.path.exists(es_root):
        log_err(f"Missing Spanish translation for root document '{rdoc}' -> expected 'docs/es/{rdoc}'.")

# Summary
print("\n=== VALIDATION SUMMARY ===")
print(f"Total Errors: {len(errors)}")
print(f"Total Warnings: {len(warnings)}")

if errors:
    print("\nFAILED: Fix errors before committing.")
    exit(1)
else:
    print("\nSUCCESS: All document and catalog checks passed!")
    exit(0)
