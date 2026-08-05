#!/usr/bin/env python3
"""Remplit `name` sur tous les produits e-Invoicing remote sans nom.

Le seed demo avait mis le titre dans `description` et oublié `name` —
CRM refuse alors d'enregistrer (photo, etc.).

Usage (app fermée conseillée) :

    python3 tool/fix_product_names.py
"""

from __future__ import annotations

import sys
from pathlib import Path

# Réutilise les helpers / PRODUCTS du seed demo.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from seed_screenshot_demo import (  # noqa: E402
    PRODUCTS,
    api_einv,
    load_password,
    now_iso,
)


def main() -> None:
    password = load_password()
    data = api_einv("GET", "/einvoicing/products", password)
    items = data.get("items") or data.get("products") or []
    if not isinstance(items, list):
        sys.exit(f"Réponse produits inattendue: {data!r}")

    by_ref = {p["ref"]: p["name"] for p in PRODUCTS}
    fixed = 0
    ts = now_iso()

    for raw in items:
        if not isinstance(raw, dict):
            continue
        uuid = str(raw.get("uuid") or "").strip()
        if not uuid:
            continue
        name = str(raw.get("name") or "").strip()
        desc = str(raw.get("description") or "").strip()
        ref = str(raw.get("ref") or "").strip()
        if name:
            print(f"  OK  {ref or uuid}: {name}")
            continue

        new_name = by_ref.get(ref) or desc or ref or f"Product {uuid[:8]}"
        body = dict(raw)
        body["uuid"] = uuid
        body["name"] = new_name
        if not desc:
            body["description"] = new_name
        body["updated_at"] = ts
        # Garde photo_paths telles quelles (liste ou JSON string).
        api_einv("POST", "/einvoicing/products", password, body)
        print(f"  FIX {ref or uuid}: → {new_name}")
        fixed += 1

    print(f"\nTerminé — {fixed} produit(s) corrigé(s), {len(items)} au total.")
    if fixed:
        print("Relance le CRM → Produits (pull remote) pour voir les noms.")


if __name__ == "__main__":
    main()
