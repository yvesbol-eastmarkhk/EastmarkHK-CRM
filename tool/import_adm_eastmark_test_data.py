#!/usr/bin/env python3
"""Wipe remote e-Invoicing + seed CRM clients + remote products (with photos).

Source : adm.eastmark.hk/data/eastmark.sqlite + product_images/

Auth API (comme l'app) :
  Authorization: Bearer <FTP password>
  X-Emhk-Ftp-User: inv@eastmarkhk.com

Mot de passe (premier trouvé) :
  1. EMHK_FTP_PASSWORD
  2. ~/Library/Application Support/com.eastmarkhk.eastmarkhkCrm/.remote_ftp_secret (base64)
  3. Containers/.../com.eastmarkhk.einvoicing/.remote_ftp_secret (base64)
"""

from __future__ import annotations

import base64
import json
import os
import sqlite3
import subprocess
import sys
import urllib.error
import urllib.request
import uuid
from datetime import datetime, timezone
from pathlib import Path

SRC_DB = Path(
    "/Users/yvesbolkaerts/development/EastmarkHK/Eastmark.hk/"
    "adm.eastmark.hk/data/eastmark.sqlite"
)
SRC_IMAGES = Path(
    "/Users/yvesbolkaerts/development/EastmarkHK/Eastmark.hk/"
    "adm.eastmark.hk/data/product_images"
)
CRM_DB = Path.home() / (
    "Library/Application Support/com.eastmarkhk.eastmarkhkCrm/emhk_crm_v2.db"
)
API_BASE = os.environ.get(
    "EMHK_API_BASE", "https://inv.eastmarkhk.com/index.php"
).rstrip("/")
FTP_USER = os.environ.get("EMHK_FTP_USER", "inv@eastmarkhk.com").strip()

COUNTRY_MAP = {
    "brazil": "BR",
    "belgium": "BE",
    "united states": "US",
    "usa": "US",
    "hong kong": "HK",
    "china": "CN",
    "france": "FR",
    "germany": "DE",
    "netherlands": "NL",
    "portugal": "PT",
    "spain": "ES",
    "italy": "IT",
    "united kingdom": "GB",
    "uk": "GB",
}


def now_iso() -> str:
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.%f")[:-3] + "Z"


def country_code(raw: str | None) -> str | None:
    if not raw:
        return None
    t = raw.strip()
    if len(t) == 2 and t.isalpha():
        return t.upper()
    return COUNTRY_MAP.get(t.lower(), t[:2].upper() if len(t) >= 2 else None)


def clean_tax(raw: str | None) -> str | None:
    if not raw:
        return None
    t = raw.strip()
    for prefix in ("CNPJ:", "VAT:", "BTW:", "NIF:", "EIN:"):
        if t.upper().startswith(prefix):
            t = t[len(prefix) :].strip()
    return t or None


def load_password() -> str:
    env = (os.environ.get("EMHK_FTP_PASSWORD") or "").strip()
    if env:
        return env

    # FlutterSecureStorage (CRM) — même clé que EinvoiceRemoteConfig.
    for svc, acct in (
        ("flutter_secure_storage_service", "einvoice_remote.password"),
        ("flutter_secure_storage", "einvoice_remote.password"),
    ):
        r = subprocess.run(
            ["security", "find-generic-password", "-s", svc, "-a", acct, "-w"],
            capture_output=True,
            text=True,
        )
        pwd = (r.stdout or "").strip()
        if r.returncode == 0 and pwd:
            return pwd

    candidates = [
        Path.home()
        / "Library/Application Support/com.eastmarkhk.eastmarkhkCrm/.remote_ftp_secret",
        Path.home()
        / (
            "Library/Containers/com.eastmarkhk.einvoicing/Data/Library/"
            "Application Support/com.eastmarkhk.einvoicing/.remote_ftp_secret"
        ),
    ]
    for p in candidates:
        if not p.exists():
            continue
        raw = p.read_text(encoding="utf-8").strip()
        if not raw:
            continue
        try:
            decoded = base64.b64decode(raw).decode("utf-8").strip()
            if decoded:
                return decoded
        except Exception:
            if raw:
                return raw
    sys.exit(
        "Mot de passe API introuvable. Exportez EMHK_FTP_PASSWORD "
        "ou configurez le module e-Invoicing distant dans le CRM."
    )


def quit_apps() -> None:
    for app in ("EastmarkHK CRM", "EastmarkHK e-Invoicing"):
        subprocess.run(
            ["osascript", "-e", f'tell application "{app}" to quit'],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )


def api_request(
    method: str,
    path: str,
    password: str,
    body: dict | None = None,
    timeout: int = 120,
) -> dict:
    url = f"{API_BASE}{path}"
    if "?" not in url:
        url = f"{url}?_={int(datetime.now().timestamp() * 1000)}"
    data = None if body is None else json.dumps(body).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=data,
        method=method,
        headers={
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": f"Bearer {password}",
            "X-Emhk-Ftp-User": FTP_USER,
            "Cache-Control": "no-cache",
            "User-Agent": "EMHK-CRM-seed-tool",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=timeout) as res:
            raw = res.read().decode("utf-8")
    except urllib.error.HTTPError as e:
        err = e.read().decode("utf-8", errors="replace")[:800]
        raise RuntimeError(f"API {method} {path} → HTTP {e.code}: {err}") from e
    if not raw.strip():
        return {}
    out = json.loads(raw)
    if isinstance(out, dict) and out.get("ok") is False:
        raise RuntimeError(f"API {method} {path} → {out}")
    return out if isinstance(out, dict) else {"ok": True, "data": out}


def wipe_remote(password: str) -> None:
    print("→ Wipe remote e-Invoicing…")
    out = api_request(
        "DELETE",
        "/einvoicing/wipe-all?wipe=1",
        password,
        {"wipe": True},
    )
    deleted = out.get("deleted_rows") or out.get("deleted") or out
    print("  wipe OK:", deleted if isinstance(deleted, dict) else out.get("ok"))
    ping = api_request("GET", "/einvoicing/ping", password)
    print("  ping counts:", ping.get("counts"))


def wipe_crm_local() -> sqlite3.Connection:
    if not CRM_DB.exists():
        sys.exit(f"CRM DB introuvable: {CRM_DB}")
    con = sqlite3.connect(CRM_DB)
    for table in ("task_history", "tasks", "contacts", "clients"):
        con.execute(f"DELETE FROM {table}")
    con.commit()
    print(f"→ CRM local vidé → {CRM_DB}")
    return con


def import_clients(src: sqlite3.Connection, crm: sqlite3.Connection, password: str) -> int:
    rows = src.execute(
        "SELECT id, name, address, zip, city, address2, tax_id, country, phone, "
        "email, eori, notes, br_uf, br_bairro, us_state, ca_province, au_state, "
        "website, updated_at FROM customers ORDER BY name"
    ).fetchall()
    n = 0
    for r in rows:
        (
            cid,
            name,
            address,
            zip_c,
            city,
            address2,
            tax_id,
            country,
            phone,
            email,
            eori,
            notes,
            br_uf,
            br_bairro,
            us_state,
            ca_province,
            au_state,
            website,
            updated_at,
        ) = r
        if not (name or "").strip():
            continue
        cc = country_code(country)
        state = (br_uf or us_state or ca_province or au_state or "").strip() or None
        district = (br_bairro or "").strip() or None
        addr = (address or "").strip()
        if address2 and address2.strip():
            addr = f"{addr}, {address2.strip()}" if addr else address2.strip()
        ts = now_iso()
        tax = clean_tax(tax_id)

        crm.execute(
            """
            INSERT INTO clients (
              id, name, contact_name, country, tax_id, peppol_id, website,
              email, phone, phone_country, address, district, zip, city, state,
              tags, notes, use_einvoicing, status, created_at, updated_at, deleted_at
            ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NULL)
            """,
            (
                cid,
                name.strip(),
                None,
                cc,
                tax,
                None,
                (website or "").strip() or None,
                (email or "").strip() or None,
                (phone or "").strip() or None,
                cc,
                addr or None,
                district,
                (zip_c or "").strip() or None,
                (city or "").strip() or None,
                state,
                "",
                (notes or "").strip() or None,
                1,
                "active",
                ts,
                updated_at or ts,
            ),
        )

        remote_uuid = str(uuid.uuid4())
        api_request(
            "POST",
            "/einvoicing/customers",
            password,
            {
                "uuid": remote_uuid,
                "name": name.strip(),
                "email": (email or "").strip(),
                "phone": (phone or "").strip(),
                "phone_country_code": cc or "",
                "address": addr or "",
                "district": district or "",
                "zip": (zip_c or "").strip(),
                "city": (city or "").strip(),
                "state": state or "",
                "country_code": cc or "",
                "vat_number": tax or "",
                "eori": (eori or "").strip(),
                "use_e_invoicing": 1,
                "notes": (notes or "").strip(),
                "updated_at": ts,
            },
        )
        n += 1
        if n % 10 == 0:
            print(f"  … {n} clients")
    crm.commit()
    print(f"→ Clients : {n} (CRM local + remote)")
    return n


def import_products(src: sqlite3.Connection, password: str) -> int:
    rows = src.execute(
        "SELECT id, internal_ref, description, tech, comment, hs_code, "
        "unit_price, image, updated_at FROM products ORDER BY internal_ref"
    ).fetchall()
    n = 0
    with_photo = 0
    for r in rows:
        (
            pid,
            ref,
            description,
            tech,
            comment,
            hs_code,
            unit_price,
            image,
            updated_at,
        ) = r
        name = (description or ref or pid or "").strip()
        if not name:
            continue
        photos: list[str] = []
        if image:
            src_img = SRC_IMAGES / image
            if not src_img.exists():
                alts = list(SRC_IMAGES.glob(f"{pid}.*"))
                src_img = alts[0] if alts else src_img
            if src_img.exists():
                rel = f"product_photos/{src_img.name}"
                b64 = base64.b64encode(src_img.read_bytes()).decode("ascii")
                api_request(
                    "POST",
                    "/einvoicing/media",
                    password,
                    {"path": rel, "content_base64": b64},
                    timeout=180,
                )
                photos = [rel]
                with_photo += 1

        notes_parts = [p for p in [(tech or "").strip(), (comment or "").strip()] if p]
        notes = "\n\n".join(notes_parts)
        api_request(
            "POST",
            "/einvoicing/products",
            password,
            {
                "uuid": str(uuid.uuid4()),
                "ref": (ref or "").strip(),
                "name": name[:200],
                "description": (description or "").strip(),
                "hs_code": (hs_code or "").strip(),
                "tax_rate": 0,
                "sale_price": float(unit_price or 0),
                "photo_paths": photos,
                "notes": notes,
                "updated_at": updated_at or now_iso(),
            },
        )
        n += 1
        if n % 20 == 0:
            print(f"  … {n} produits")
    print(f"→ Produits : {n} (dont {with_photo} avec image)")
    return n


def main() -> int:
    if not SRC_DB.exists():
        print("Source introuvable:", SRC_DB, file=sys.stderr)
        return 1
    if not SRC_IMAGES.exists():
        print("Images introuvables:", SRC_IMAGES, file=sys.stderr)
        return 1

    password = load_password()
    print(f"API {API_BASE}  user={FTP_USER}")
    print("Fermeture apps…")
    quit_apps()

    wipe_remote(password)
    crm = wipe_crm_local()
    src = sqlite3.connect(f"file:{SRC_DB}?mode=ro", uri=True)
    try:
        import_clients(src, crm, password)
        import_products(src, password)
        ping = api_request("GET", "/einvoicing/ping", password)
        local_n = crm.execute(
            "SELECT COUNT(*) FROM clients WHERE deleted_at IS NULL"
        ).fetchone()[0]
        print("Terminé.")
        print("  CRM clients :", local_n)
        print("  Remote ping :", ping.get("counts"))
    finally:
        src.close()
        crm.close()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
