#!/usr/bin/env python3
"""Seed démo screenshots (App Store / Windows Store / site).

Ce que ça fait :
  - Remplace Réglages → Company par « Nova Components GmbH » (+ logo)
    (EastmarkHK reste le créateur de l’app — on ne touche PAS à ça)
  - Efface clients / contacts / tâches / opportunités / activités CRM
  - Soft-delete + push vers le serveur CRM (si --remote)
  - Wipe e-Invoicing remote + produits (2–3 photos) / devis / factures
  - Recrée un jeu factice cohérent pour captures d’écran

Usage (app FERMÉE) :

    python3 tool/seed_screenshot_demo.py --remote

Sans push CRM / wipe e-Invoicing (local only) :

    python3 tool/seed_screenshot_demo.py --local-only
"""

from __future__ import annotations

import argparse
import base64
import json
import os
import shutil
import sqlite3
import subprocess
import sys
import urllib.error
import urllib.request
import uuid
from datetime import datetime, timedelta, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASSETS = Path(__file__).resolve().parent / "demo_screenshot"
LOGO_SRC = ASSETS / "company_logo.png"
PRODUCTS_DIR = ASSETS / "products"

API_EINV = os.environ.get(
    "EMHK_API_BASE",
    # Même base que l’app (inv.eastmarkhk.com est remappé → emhk…/invoice).
    "https://emhk.eastmarkhk.com/invoice/index.php",
).rstrip("/")
FTP_USER = os.environ.get("EMHK_FTP_USER", "inv@eastmarkhk.com").strip()
CRM_SYNC_URL = os.environ.get(
    "EMHK_CRM_SYNC_URL", "https://emhk.eastmarkhk.com/crm/sync.php"
).rstrip("/")
CRM_ACCOUNT = os.environ.get("EMHK_CRM_ACCOUNT", "emhk@eastmarkhk.com").strip()

# Chemins Application Support CRM (sandbox macOS en premier).
CRM_SUPPORT_CANDIDATES = [
    Path.home()
    / "Library/Containers/com.eastmarkhk.eastmarkhkcrm/Data/Library/Application Support/com.eastmarkhk.eastmarkhkcrm",
    Path.home()
    / "Library/Application Support/com.eastmarkhk.eastmarkhkcrm",
    Path.home()
    / "Library/Application Support/com.eastmarkhk.eastmarkhkCrm",
]


def now_iso() -> str:
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.%f")[:-3] + "Z"


def uid() -> str:
    return str(uuid.uuid4())


def find_crm_dir() -> Path:
    for p in CRM_SUPPORT_CANDIDATES:
        if (p / "emhk_crm.db").exists() and (p / "emhk_crm_v2.db").exists():
            return p
    sys.exit("Bases CRM introuvables (emhk_crm.db + emhk_crm_v2.db).")


def load_password() -> str:
    env = (os.environ.get("EMHK_FTP_PASSWORD") or os.environ.get("EMHK_CRM_PASSWORD") or "").strip()
    if env:
        return env
    # Préférer le mot de passe e-Invoicing du trousseau (fichier .remote_ftp_secret
    # peut être un ancien secret non accepté par l’API).
    for svc, acct in (
        ("flutter_secure_storage_service", "einvoice_remote.password"),
        ("flutter_secure_storage_service", "crm_sync_password"),
        ("flutter_secure_storage", "einvoice_remote.password"),
        ("flutter_secure_storage", "crm_sync_password"),
    ):
        r = subprocess.run(
            ["security", "find-generic-password", "-s", svc, "-a", acct, "-w"],
            capture_output=True,
            text=True,
        )
        pwd = (r.stdout or "").strip()
        if r.returncode == 0 and pwd:
            return pwd
    # Dernier recours : secrets fichier (app e-Invoicing d’abord — même longueur API).
    for p in (
        Path.home()
        / "Library/Containers/com.eastmarkhk.einvoicing/Data/Library/Application Support/com.eastmarkhk.einvoicing/.remote_ftp_secret",
        Path.home() / "Library/Application Support/com.eastmarkhk.eastmarkhkCrm/.remote_ftp_secret",
        Path.home()
        / "Library/Containers/com.eastmarkhk.eastmarkhkcrm/Data/Library/Application Support/com.eastmarkhk.eastmarkhkcrm/.remote_ftp_secret",
    ):
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
            return raw
    sys.exit("Mot de passe API introuvable (EMHK_FTP_PASSWORD / keychain / .remote_ftp_secret).")


def load_einv_user() -> str:
    env = (os.environ.get("EMHK_FTP_USER") or "").strip()
    if env:
        return env
    for plist in (
        Path.home() / "Library/Preferences/com.eastmarkhk.eastmarkhkCrm.plist",
        Path.home()
        / "Library/Containers/com.eastmarkhk.eastmarkhkcrm/Data/Library/Preferences/com.eastmarkhk.eastmarkhkCrm.plist",
    ):
        if not plist.exists():
            continue
        r = subprocess.run(["plutil", "-extract", "flutter.einvoice_remote.user", "raw", str(plist)], capture_output=True, text=True)
        u = (r.stdout or "").strip()
        if r.returncode == 0 and u:
            return u
    return FTP_USER


def quit_apps() -> None:
    for app in ("EastmarkHK CRM", "EastmarkHK e-Invoicing"):
        subprocess.run(
            ["osascript", "-e", f'tell application "{app}" to quit'],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )


def api_einv(
    method: str,
    path: str,
    password: str,
    body: dict | None = None,
    timeout: int = 180,
) -> dict:
    url = f"{API_EINV}{path}"
    if "?" not in url:
        url = f"{url}?_={int(datetime.now().timestamp() * 1000)}"
    data = None if body is None else json.dumps(body).encode("utf-8")
    ftp_user = load_einv_user()
    req = urllib.request.Request(
        url,
        data=data,
        method=method,
        headers={
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": f"Bearer {password}",
            "X-Emhk-Ftp-User": ftp_user,
            "Cache-Control": "no-cache",
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X) EastmarkHK-CRM/1.0",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=timeout) as res:
            raw = res.read().decode("utf-8")
    except urllib.error.HTTPError as e:
        err = e.read().decode("utf-8", errors="replace")[:800]
        raise RuntimeError(f"eInv {method} {path} → HTTP {e.code}: {err}") from e
    if not raw.strip():
        return {}
    out = json.loads(raw)
    if isinstance(out, dict) and out.get("ok") is False:
        raise RuntimeError(f"eInv {method} {path} → {out}")
    return out if isinstance(out, dict) else {"ok": True, "data": out}


def wipe_einvoicing(password: str) -> None:
    print("→ Wipe e-Invoicing remote…")
    out = api_einv("DELETE", "/einvoicing/wipe-all?wipe=1", password, {"wipe": True})
    print("  wipe OK:", out.get("deleted_rows") or out.get("deleted") or out.get("ok"))
    ping = api_einv("GET", "/einvoicing/ping", password)
    print("  ping:", ping.get("counts"))


def crm_push(password: str, push: dict[str, list], since: str = "1970-01-01T00:00:00.000Z") -> dict:
    body = {
        "auth": {"account": CRM_ACCOUNT, "password": password},
        "since": since,
        "push": push,
    }
    data = json.dumps(body).encode("utf-8")
    req = urllib.request.Request(
        CRM_SYNC_URL,
        data=data,
        method="POST",
        headers={
            "Content-Type": "application/json",
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X) EastmarkHK-CRM/1.0",
            "Accept": "application/json",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=180) as res:
            raw = res.read().decode("utf-8")
    except urllib.error.HTTPError as e:
        err = e.read().decode("utf-8", errors="replace")[:800]
        raise RuntimeError(f"CRM sync HTTP {e.code}: {err}") from e
    out = json.loads(raw) if raw.strip() else {}
    if isinstance(out, dict) and out.get("ok") is False:
        raise RuntimeError(f"CRM sync failed: {out}")
    return out if isinstance(out, dict) else {"ok": True}


def soft_delete_all(con: sqlite3.Connection, tables: list[str], ts: str) -> dict[str, list]:
    """Marque deleted_at — nécessaire pour tombstones sync."""
    for table in tables:
        n = con.execute(
            f"UPDATE {table} SET deleted_at=?, updated_at=? WHERE deleted_at IS NULL",
            (ts, ts),
        ).rowcount
        # Remonter updated_at des tombstones déjà présents (seed local précédent).
        n2 = con.execute(
            f"UPDATE {table} SET updated_at=? WHERE deleted_at IS NOT NULL",
            (ts,),
        ).rowcount
        print(f"  soft-delete {table}: {n} (+{n2} tombstones restamp)")
    con.commit()
    full: dict[str, list] = {}
    for table in tables:
        rows = con.execute(f"SELECT * FROM {table}").fetchall()
        cols = [d[0] for d in con.execute(f"SELECT * FROM {table} LIMIT 0").description]
        full[table] = [dict(zip(cols, row)) for row in rows]
        print(f"  push snapshot {table}: {len(full[table])}")
    return full


def set_company_profile(support: Path, app_db: Path) -> None:
    """Réglages → Company = client fictif Nova Components (pas EastmarkHK)."""
    branding = support / "branding"
    branding.mkdir(parents=True, exist_ok=True)
    logo_dst = branding / "company_logo.png"
    shutil.copy2(LOGO_SRC, logo_dst)

    con = sqlite3.connect(app_db)
    profile = {
        "company_name": "Nova Components GmbH",
        "company_country": "DE",
        "company_tax_id": "DE312456789",
        "company_address": "Industriestraße 42",
        "company_district": "",
        "company_zip": "80339",
        "company_city": "München",
        "company_state": "BY",
        "company_phone": "+49 89 5555 1200",
        "company_phone_country": "DE",
        "company_email": "hello@nova-components.example",
        "company_logo_path": str(logo_dst),
    }
    for k, v in profile.items():
        con.execute(
            "INSERT INTO settings(key, value) VALUES(?, ?) "
            "ON CONFLICT(key) DO UPDATE SET value=excluded.value",
            (k, v),
        )
    con.commit()
    con.close()
    print(f"→ Réglages Company → Nova Components GmbH (+ logo {logo_dst.name})")


# ---------------------------------------------------------------------------
# Demo dataset
# ---------------------------------------------------------------------------

CLIENTS = [
    {
        "name": "Atlas Logistics BV",
        "country": "NL",
        "city": "Rotterdam",
        "zip": "3011 AD",
        "address": "Wilhelminakade 123",
        "email": "buying@atlas-logistics.example",
        "phone": "+31 10 555 0142",
        "status": "active",
        "tax": "NL855555512B01",
        "contact": ("Eva", "de Vries", "Buyer", "eva@atlas-logistics.example"),
    },
    {
        "name": "Harbor Retail Group",
        "country": "GB",
        "city": "London",
        "zip": "E1 6AN",
        "address": "14 Brick Lane",
        "email": "ops@harbor-retail.example",
        "phone": "+44 20 7946 0991",
        "status": "active",
        "tax": "GB123456789",
        "contact": ("James", "Whitfield", "Operations", "james@harbor-retail.example"),
    },
    {
        "name": "Nordic Cold Chain AB",
        "country": "SE",
        "city": "Göteborg",
        "zip": "411 04",
        "address": "Linnégatan 8",
        "email": "procurement@nordic-cold.example",
        "phone": "+46 31 555 2200",
        "status": "prospect",
        "tax": "SE556677889901",
        "contact": ("Astrid", "Lind", "Procurement", "astrid@nordic-cold.example"),
    },
    {
        "name": "Méditerranée Fruits SA",
        "country": "FR",
        "city": "Marseille",
        "zip": "13002",
        "address": "12 Quai du Port",
        "email": "achats@med-fruits.example",
        "phone": "+33 4 91 55 01 20",
        "status": "active",
        "tax": "FR12345678901",
        "contact": ("Camille", "Bernard", "Acheteuse", "camille@med-fruits.example"),
    },
    {
        "name": "Pacific Gate Trading",
        "country": "SG",
        "city": "Singapore",
        "zip": "018989",
        "address": "1 Marina Boulevard",
        "email": "supply@pacificgate.example",
        "phone": "+65 6555 0188",
        "status": "active",
        "tax": None,
        "contact": ("Wei", "Tan", "Supply Chain", "wei@pacificgate.example"),
    },
    {
        "name": "Alpine Pharma AG",
        "country": "CH",
        "city": "Basel",
        "zip": "4051",
        "address": "Aeschenplatz 4",
        "email": "qc@alpine-pharma.example",
        "phone": "+41 61 555 3344",
        "status": "prospect",
        "tax": "CHE123456789",
        "contact": ("Lukas", "Meier", "Quality", "lukas@alpine-pharma.example"),
    },
    {
        "name": "Iberia Fresh Export SL",
        "country": "ES",
        "city": "Valencia",
        "zip": "46024",
        "address": "Calle Colón 22",
        "email": "comercial@iberia-fresh.example",
        "phone": "+34 96 555 0770",
        "status": "active",
        "tax": "ESA12345678",
        "contact": ("Sofía", "Ruiz", "Comercial", "sofia@iberia-fresh.example"),
    },
    {
        "name": "Tokyo Precision Co.",
        "country": "JP",
        "city": "Tokyo",
        "zip": "100-0005",
        "address": "2-1 Marunouchi, Chiyoda",
        "email": "import@tokyo-precision.example",
        "phone": "+81 3 5555 4400",
        "status": "prospect",
        "tax": None,
        "contact": ("Hana", "Suzuki", "Import Manager", "hana@tokyo-precision.example"),
    },
    {
        "name": "Rhine Packaging GmbH",
        "country": "DE",
        "city": "Düsseldorf",
        "zip": "40213",
        "address": "Königsallee 60",
        "email": "einkauf@rhine-pack.example",
        "phone": "+49 211 555 0890",
        "status": "active",
        "tax": "DE811111111",
        "contact": ("Markus", "Keller", "Einkauf", "markus@rhine-pack.example"),
    },
    {
        "name": "Celtic Seafoods Ltd",
        "country": "IE",
        "city": "Cork",
        "zip": "T12 XY45",
        "address": "Lapp's Quay 5",
        "email": "orders@celtic-seafoods.example",
        "phone": "+353 21 555 0166",
        "status": "inactive",
        "tax": "IE1234567T",
        "contact": ("Aoife", "Murphy", "Orders", "aoife@celtic-seafoods.example"),
    },
    {
        "name": "Benelux Auto Parts",
        "country": "BE",
        "city": "Antwerpen",
        "zip": "2000",
        "address": "Scheldekaai 18",
        "email": "parts@benelux-auto.example",
        "phone": "+32 3 555 22 11",
        "status": "active",
        "tax": "BE0123456789",
        "contact": ("Pieter", "Janssens", "Parts Manager", "pieter@benelux-auto.example"),
    },
    {
        "name": "Gulf Warehouse FZE",
        "country": "AE",
        "city": "Dubai",
        "zip": "00000",
        "address": "Jebel Ali Free Zone, Plot 12",
        "email": "ops@gulf-warehouse.example",
        "phone": "+971 4 555 0199",
        "status": "prospect",
        "tax": None,
        "contact": ("Omar", "Hassan", "Ops Director", "omar@gulf-warehouse.example"),
    },
]

PRODUCTS = [
    {
        "slug": "uhf-tag",
        "ref": "NV-UHF-1000",
        "name": "UHF RFID Tag Roll (1000 pcs)",
        "hs": "852352",
        "price": 89.0,
        "variants": ["front", "angle", "detail"],
    },
    {
        "slug": "nfc-card",
        "ref": "NV-NFC-CARD",
        "name": "NFC Keycard White",
        "hs": "852352",
        "price": 1.45,
        "variants": ["front", "angle", "detail"],
    },
    {
        "slug": "handheld",
        "ref": "NV-RDR-H1",
        "name": "Handheld RFID Reader H1",
        "hs": "847190",
        "price": 420.0,
        "variants": ["front", "angle", "detail"],
    },
    {
        "slug": "gateway",
        "ref": "NV-GW-IOT",
        "name": "Industrial IoT Gateway",
        "hs": "851762",
        "price": 680.0,
        "variants": ["front", "angle"],
    },
    {
        "slug": "anti-metal",
        "ref": "NV-AM-500",
        "name": "Anti-metal RFID Label (500)",
        "hs": "852352",
        "price": 145.0,
        "variants": ["front", "angle", "detail"],
    },
    {
        "slug": "access",
        "ref": "NV-ACS-R2",
        "name": "Access Control Reader R2",
        "hs": "847190",
        "price": 210.0,
        "variants": ["front", "angle"],
    },
    {
        "slug": "temp-tag",
        "ref": "NV-TMP-200",
        "name": "Temperature Sensor Tag (200)",
        "hs": "902519",
        "price": 320.0,
        "variants": ["front", "angle", "detail"],
    },
    {
        "slug": "ribbon",
        "ref": "NV-RIB-WAX",
        "name": "RFID Printer Ribbon Kit",
        "hs": "961210",
        "price": 38.5,
        "variants": ["front", "angle"],
    },
]


def seed_local_crm(support: Path, password: str | None, do_remote: bool) -> None:
    app_db = support / "emhk_crm.db"
    v2_db = support / "emhk_crm_v2.db"
    ts = now_iso()
    today = datetime.now().astimezone()

    # Backup rapide
    bak = support / f"pre_demo_{today.strftime('%Y%m%d-%H%M%S')}"
    bak.mkdir(exist_ok=True)
    shutil.copy2(app_db, bak / "emhk_crm.db")
    shutil.copy2(v2_db, bak / "emhk_crm_v2.db")
    print(f"→ Backup → {bak}")

    set_company_profile(support, app_db)

    app = sqlite3.connect(app_db)
    app.row_factory = sqlite3.Row
    v2 = sqlite3.connect(v2_db)

    # Soft-delete AppDatabase (sync)
    push_deletes = soft_delete_all(
        app,
        ["activities", "tasks", "opportunities", "contacts", "companies"],
        ts,
    )

    # Hard wipe CrmDb UI
    for table in ("task_history", "tasks", "contacts", "clients"):
        v2.execute(f"DELETE FROM {table}")
    v2.commit()
    print("→ CrmDb (v2) vidé")

    # Insert demo graph
    client_ids: list[str] = []
    contact_ids: list[str] = []
    company_rows: list[dict] = []
    contact_rows: list[dict] = []
    opp_rows: list[dict] = []
    task_rows_app: list[dict] = []
    activity_rows: list[dict] = []
    einv_customer_uuids: dict[str, str] = {}

    stages_open = ["lead", "contacted", "quoted", "negotiation"]
    amounts = [18500, 42000, 9600, 128000, 27500, 54000, 15300, 88000, 22100, 67000]

    for i, c in enumerate(CLIENTS):
        cid = uid()
        ctid = uid()
        client_ids.append(cid)
        contact_ids.append(ctid)
        fn, ln, role, mail = c["contact"]
        einv_uuid = uid()
        einv_customer_uuids[cid] = einv_uuid

        addr_json = json.dumps(
            {
                "line1": c["address"],
                "zip": c["zip"],
                "city": c["city"],
                "phone": c["phone"],
                "email": c["email"],
            },
            ensure_ascii=False,
        )

        company_rows.append(
            {
                "id": cid,
                "name": c["name"],
                "vat_number": c.get("tax"),
                "peppol_id": None,
                "website": None,
                "tags": "demo,store",
                "notes": "Screenshot demo data",
                "country": c["country"],
                "address_json": addr_json,
                "einvoice_customer_uuid": einv_uuid,
                "created_at": ts,
                "updated_at": ts,
                "deleted_at": None,
            }
        )
        contact_rows.append(
            {
                "id": ctid,
                "company_id": cid,
                "first_name": fn,
                "last_name": ln,
                "email": mail,
                "phone": c["phone"],
                "role": role,
                "notes": None,
                "phone_country": c["country"],
                "messaging_json": None,
                "created_at": ts,
                "updated_at": ts,
                "deleted_at": None,
            }
        )

        v2.execute(
            """
            INSERT INTO clients (
              id, name, contact_name, country, tax_id, peppol_id, website,
              email, phone, phone_country, address, district, zip, city, state,
              tags, notes, use_einvoicing, status, created_at, updated_at, deleted_at
            ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NULL)
            """,
            (
                cid,
                c["name"],
                f"{fn} {ln}",
                c["country"],
                c.get("tax"),
                None,
                None,
                c["email"],
                c["phone"],
                c["country"],
                c["address"],
                None,
                c["zip"],
                c["city"],
                None,
                "demo,store",
                "Screenshot demo data",
                1,
                c["status"],
                ts,
                ts,
            ),
        )
        v2.execute(
            """
            INSERT INTO contacts (
              id, client_id, first_name, last_name, email, phone, phone_country,
              role, notes, is_primary, created_at, updated_at, deleted_at
            ) VALUES (?,?,?,?,?,?,?,?,?,1,?,?,NULL)
            """,
            (ctid, cid, fn, ln, mail, c["phone"], c["country"], role, None, ts, ts),
        )

        # Opportunity for most clients
        if i < 10:
            stage = stages_open[i % len(stages_open)]
            oid = uid()
            close = (today + timedelta(days=7 + i * 3)).date().isoformat()
            opp_rows.append(
                {
                    "id": oid,
                    "company_id": cid,
                    "contact_id": ctid,
                    "pipeline_id": "default",
                    "stage": stage,
                    "title": f"{c['name'].split()[0]} — RFID rollout",
                    "amount": amounts[i % len(amounts)],
                    "currency": "EUR",
                    "probability": 20 + (i * 7) % 60,
                    "expected_close": close,
                    "won_lost": None,
                    "closed_at": None,
                    "notes": "Demo opportunity for store screenshots",
                    "stage_updated_at": ts,
                    "created_at": ts,
                    "updated_at": ts,
                    "deleted_at": None,
                }
            )

        # Tasks — mix overdue / today / tomorrow / week
        due_offsets = [-2, 0, 1, 3, 6]
        actions = ["call", "email", "chat", "meeting", "other"]
        titles = [
            "Call about PO confirmation",
            "Send quote follow-up",
            "WhatsApp: delivery window",
            "Meeting — pilot site visit",
            "Prepare technical datasheet",
        ]
        off = due_offsets[i % len(due_offsets)]
        due_local = (today + timedelta(days=off)).replace(
            hour=10 + (i % 6), minute=0, second=0, microsecond=0
        )
        due_utc = due_local.astimezone(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.000Z")
        tid = uid()
        action = actions[i % len(actions)]
        channel = "whatsapp" if action == "chat" else None
        phase = ["lead", "first_contact", "quoted", "negotiation", "qualification"][i % 5]
        v2.execute(
            """
            INSERT INTO tasks (
              id, title, client_id, contact_id, due_at, kind, status, notes, phase,
              submitted_at, approved_at, dismissed_at, created_at, updated_at, deleted_at,
              action_type, channel_id
            ) VALUES (?,?,?,?,?,'action','open',?,?,NULL,NULL,NULL,?,?,NULL,?,?)
            """,
            (
                tid,
                titles[i % len(titles)],
                cid,
                ctid,
                due_utc,
                "Demo follow-up",
                phase,
                ts,
                ts,
                action,
                channel,
            ),
        )
        v2.execute(
            """
            INSERT INTO task_history (id, task_id, kind, title, detail, ref_type, ref_id, created_at)
            VALUES (?,?,?,?,NULL,NULL,NULL,?)
            """,
            (uid(), tid, "created", "Tâche créée", ts),
        )
        task_rows_app.append(
            {
                "id": tid,
                "company_id": cid,
                "contact_id": ctid,
                "title": titles[i % len(titles)],
                "due_date": due_utc,
                "done_at": None,
                "notes": "Demo follow-up",
                "assigned_to": None,
                "opportunity_id": None,
                "created_at": ts,
                "updated_at": ts,
                "deleted_at": None,
            }
        )

        activity_rows.append(
            {
                "id": uid(),
                "company_id": cid,
                "contact_id": ctid,
                "opportunity_id": None,
                "type": "call",
                "module_id": None,
                "ref_table": None,
                "ref_id": None,
                "title": f"Call with {fn} {ln}",
                "body": "Discussed pilot RFID tags for Q3.",
                "happened_at": (today - timedelta(days=(i % 5) + 1))
                .astimezone(timezone.utc)
                .strftime("%Y-%m-%dT%H:%M:%S.000Z"),
                "created_at": ts,
                "updated_at": ts,
                "deleted_at": None,
            }
        )

    # Write AppDatabase inserts
    def insert_maps(con: sqlite3.Connection, table: str, rows: list[dict]) -> None:
        if not rows:
            return
        cols = list(rows[0].keys())
        placeholders = ",".join("?" for _ in cols)
        colsql = ",".join(cols)
        for r in rows:
            con.execute(
                f"INSERT INTO {table} ({colsql}) VALUES ({placeholders})",
                [r[c] for c in cols],
            )

    insert_maps(app, "companies", company_rows)
    insert_maps(app, "contacts", contact_rows)
    insert_maps(app, "opportunities", opp_rows)
    insert_maps(app, "tasks", task_rows_app)
    insert_maps(app, "activities", activity_rows)
    app.commit()
    v2.commit()
    print(
        f"→ Seed CRM local : {len(company_rows)} clients, {len(opp_rows)} opps, "
        f"{len(task_rows_app)} tasks, {len(activity_rows)} activities"
    )

    # e-Invoicing remote products / customers / docs
    product_remote: list[dict] = []
    if do_remote and password:
        print("→ Seed e-Invoicing customers + products…")
        for i, c in enumerate(CLIENTS):
            cid = client_ids[i]
            cuuid = einv_customer_uuids[cid]
            api_einv(
                "POST",
                "/einvoicing/customers",
                password,
                {
                    "uuid": cuuid,
                    "name": c["name"],
                    "email": c["email"],
                    "phone": c["phone"],
                    "phone_country_code": c["country"],
                    "address": c["address"],
                    "district": "",
                    "zip": c["zip"],
                    "city": c["city"],
                    "state": "",
                    "country_code": c["country"],
                    "vat_number": c.get("tax") or "",
                    "eori": "",
                    "use_e_invoicing": 1,
                    "crm_company_id": cid,
                    "notes": "Demo screenshot customer",
                    "updated_at": ts,
                },
            )

        for p in PRODUCTS:
            photos: list[str] = []
            for v in p["variants"]:
                src = PRODUCTS_DIR / f"{p['slug']}-{v}.jpg"
                if not src.exists():
                    continue
                rel = f"product_photos/{p['slug']}-{v}.jpg"
                b64 = base64.b64encode(src.read_bytes()).decode("ascii")
                api_einv(
                    "POST",
                    "/einvoicing/media",
                    password,
                    {"path": rel, "content_base64": b64},
                    timeout=180,
                )
                photos.append(rel)
            puuid = uid()
            api_einv(
                "POST",
                "/einvoicing/products",
                password,
                {
                    "uuid": puuid,
                    "ref": p["ref"],
                    "name": p["name"],
                    "description": p["name"],
                    "tech": "Nova Components demo SKU",
                    "comment": "",
                    "hs_code": p["hs"],
                    "sale_price": p["price"],
                    "tax_rate": 21,
                    "photo_paths": photos,
                    "updated_at": ts,
                },
            )
            product_remote.append({**p, "uuid": puuid, "photos": photos})
            print(f"  product {p['ref']} ({len(photos)} photos)")

        def line(prod: dict, qty: float) -> dict:
            return {
                "uuid": uid(),
                "description": prod["name"],
                "qty": qty,
                "unit_price": prod["price"],
                "product_uuid": prod["uuid"],
                "photo_path": prod["photos"][0] if prod["photos"] else None,
            }

        # Quotes
        quote_specs = [
            (0, "sent", [ (0, 10), (2, 2) ]),
            (1, "accepted", [ (1, 500), (5, 4) ]),
            (3, "draft", [ (3, 1), (6, 2) ]),
            (4, "sent", [ (4, 5), (7, 8) ]),
            (6, "accepted", [ (0, 20), (1, 200) ]),
            (8, "sent", [ (2, 3), (5, 6) ]),
        ]
        for idx, (ci, status, items) in enumerate(quote_specs):
            cust = einv_customer_uuids[client_ids[ci]]
            doc_date = today - timedelta(days=3 + idx)
            until = doc_date + timedelta(days=30)
            lines = [line(product_remote[pi], qty) for pi, qty in items]
            api_einv(
                "POST",
                "/einvoicing/quotes",
                password,
                {
                    "uuid": uid(),
                    "customer_uuid": cust,
                    "number": "",
                    "date": doc_date.astimezone(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.000Z"),
                    "valid_until": until.astimezone(timezone.utc).strftime(
                        "%Y-%m-%dT%H:%M:%S.000Z"
                    ),
                    "status": status,
                    "vat_rate": 19 if CLIENTS[ci]["country"] == "DE" else 21,
                    "notes": "Demo quote — Nova Components",
                    "lines": lines,
                },
            )

        # Invoices
        inv_specs = [
            (0, "sent", [(0, 8), (7, 4)], 14),
            (1, "paid", [(1, 300), (5, 2)], -5),
            (4, "partial", [(4, 3), (2, 1)], 7),
            (6, "overdue", [(0, 12)], -12),
            (8, "sent", [(3, 1), (6, 1)], 21),
        ]
        for idx, (ci, status, items, due_off) in enumerate(inv_specs):
            cust = einv_customer_uuids[client_ids[ci]]
            doc_date = today - timedelta(days=10 + idx)
            due = doc_date + timedelta(days=due_off if due_off > 0 else 30)
            if due_off < 0:
                due = today + timedelta(days=due_off)  # overdue
            lines = [line(product_remote[pi], qty) for pi, qty in items]
            api_einv(
                "POST",
                "/einvoicing/invoices",
                password,
                {
                    "uuid": uid(),
                    "customer_uuid": cust,
                    "number": "",
                    "date": doc_date.astimezone(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.000Z"),
                    "due_date": due.astimezone(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.000Z"),
                    "status": status,
                    "vat_rate": 19 if CLIENTS[ci]["country"] == "DE" else 21,
                    "notes": "Demo invoice — Nova Components",
                    "lines": lines,
                    "payments": [],
                },
            )
        print("→ Devis + factures seedés")
        ping = api_einv("GET", "/einvoicing/ping", password)
        print("  ping final:", ping.get("counts"))

    # Push CRM remote (snapshot complet : tombstones + nouvelles lignes)
    if do_remote and password:
        print("→ Push CRM sync (snapshot complet)…")
        # Relire les tables après insert pour snapshot à jour.
        push_payload: dict[str, list] = {}
        for table in ("companies", "contacts", "opportunities", "tasks", "activities"):
            rows = app.execute(f"SELECT * FROM {table}").fetchall()
            cols = [d[0] for d in app.execute(f"SELECT * FROM {table} LIMIT 0").description]
            push_payload[table] = [dict(zip(cols, row)) for row in rows]
            print(f"  push {table}: {len(push_payload[table])}")
        out = crm_push(password, push_payload)
        print("  CRM sync response ok=", out.get("ok", True), "keys=", list(out.keys())[:8])
        app.execute(
            "INSERT INTO settings(key, value) VALUES(?, ?) "
            "ON CONFLICT(key) DO UPDATE SET value=excluded.value",
            ("last_pushed_at", ts),
        )
        app.execute(
            "INSERT INTO settings(key, value) VALUES(?, ?) "
            "ON CONFLICT(key) DO UPDATE SET value=excluded.value",
            ("last_sync_at", ts),
        )
        # Remettre le mode remote pour les autres appareils.
        app.execute(
            "INSERT INTO settings(key, value) VALUES(?, ?) "
            "ON CONFLICT(key) DO UPDATE SET value=excluded.value",
            ("sync_mode", "remote"),
        )
        app.commit()

    app.close()
    v2.close()


def main() -> None:
    parser = argparse.ArgumentParser(description="Seed CRM + e-Invoicing demo screenshots")
    g = parser.add_mutually_exclusive_group()
    g.add_argument("--remote", action="store_true", help="Wipe/push remote (défaut recommandé)")
    g.add_argument("--local-only", action="store_true", help="Ne touche pas aux serveurs remote")
    args = parser.parse_args()
    do_remote = not args.local_only  # default remote unless --local-only

    if not LOGO_SRC.exists() or not PRODUCTS_DIR.exists():
        sys.exit(f"Assets manquants dans {ASSETS} — regénérez d’abord les images.")

    print("⚠️  Remplace les données métier par la démo Nova Components.")
    print("    EastmarkHK (éditeur de l’app) n’est pas modifié.")
    quit_apps()
    support = find_crm_dir()
    print(f"→ CRM dir: {support}")

    password = None
    if do_remote:
        password = load_password()
        wipe_einvoicing(password)

    seed_local_crm(support, password, do_remote)
    print("\n✅ Démo prête. Rouvre EastmarkHK CRM — Réglages → Company = Nova Components GmbH.")
    if do_remote:
        print("   Sync remote CRM + e-Invoicing appliqués. Les autres appareils pulleront le jeu démo.")
    else:
        print("   Mode local-only : ouvre l’app et synchronise manuellement si besoin.")


if __name__ == "__main__":
    main()
