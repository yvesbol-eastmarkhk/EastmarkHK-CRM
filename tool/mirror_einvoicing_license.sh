#!/usr/bin/env bash
# Miroir one-shot : copie la licence e-Invoicing vers l'App Group partagé
# pour que EastmarkHK CRM (sandbox) puisse l'importer.
# N'affiche jamais le token — seulement un statut.
set -euo pipefail

PREF="${HOME}/Library/Containers/com.eastmarkhk.einvoicing/Data/Library/Preferences/com.eastmarkhk.einvoicing.plist"
GROUP="${HOME}/Library/Group Containers/group.com.eastmarkhk.shared"
OUT="${GROUP}/einvoicing_license.json"

if [[ ! -f "$PREF" ]]; then
  echo "error: prefs e-Invoicing introuvables: $PREF" >&2
  exit 1
fi
if [[ ! -d "$GROUP" ]]; then
  echo "error: App Group manquant (lancez une fois e-Invoicing ou le CRM): $GROUP" >&2
  exit 1
fi

PREF="$PREF" OUT="$OUT" python3 - <<'PY'
import json, os, plistlib
from pathlib import Path
src = Path(os.environ["PREF"])
out = Path(os.environ["OUT"])
d = plistlib.loads(src.read_bytes())
token = d.get("flutter.eastmark_einvoicing.license_token")
if not isinstance(token, str) or not token.strip():
    raise SystemExit("error: aucun license_token dans les prefs e-Invoicing")
payload = {
    "license_token": token,
    "license_email": d.get("flutter.eastmark_einvoicing.license_email"),
    "data_storage_mode": d.get("flutter.data_storage_mode"),
}
out.write_text(json.dumps(payload), encoding="utf-8")
out.chmod(0o600)
print(f"OK — miroir écrit ({len(token)} car.)")
print(f"→ {out}")
PY
