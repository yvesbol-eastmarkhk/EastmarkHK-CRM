#!/usr/bin/env python3
"""Silence StoreKit 1 deprecation warnings from Flutter's in_app_purchase_storekit.

Apple deprecated SKProduct / SKPayment* on macOS 15 / iOS 18. The Flutter
plugin still ships the StoreKit 1 ObjC bridge (flutter/flutter#170442,
closed as not_planned). Runner already uses -Wno-deprecated-declarations,
but SPM package targets do not inherit those flags.

This patches:
  1) Package.swift cSettings → -Wno-deprecated-declarations
  2) ObjC public headers → #pragma clang diagnostic ignored

Safe to run repeatedly (idempotent). Intended for Xcode Cloud ci_post_clone /
ci_pre_xcodebuild after `flutter build --config-only`.
"""

from __future__ import annotations

import pathlib
import sys

MARKER = "EMHK_SILENCE_SK1_DEPRECATIONS"
UNSAFE_FLAG = '.unsafeFlags(["-Wno-deprecated-declarations"])'
HEADER_SEARCH = '.headerSearchPath("include/in_app_purchase_storekit_objc")'


def _is_iap_storekit_path(path: pathlib.Path) -> bool:
    return "in_app_purchase_storekit" in path.as_posix()


def patch_package_swift(path: pathlib.Path) -> bool:
    text = path.read_text(encoding="utf-8")
    if "Wno-deprecated-declarations" in text:
        return False
    if HEADER_SEARCH not in text:
        return False
    new = text.replace(
        HEADER_SEARCH,
        f"{HEADER_SEARCH},\n        {UNSAFE_FLAG}",
        1,
    )
    if new == text:
        return False
    path.write_text(new, encoding="utf-8")
    return True


def patch_header(path: pathlib.Path) -> bool:
    text = path.read_text(encoding="utf-8")
    if MARKER in text:
        return False
    # Only public ObjC headers that reference deprecated StoreKit types.
    if not path.suffix == ".h":
        return False
    if "SKProduct" not in text and "SKPayment" not in text and "SKStorefront" not in text and "SKRequest" not in text and "SKDownload" not in text:
        return False
    wrapped = (
        f"/* {MARKER} */\n"
        "#pragma clang diagnostic push\n"
        '#pragma clang diagnostic ignored "-Wdeprecated-declarations"\n'
        f"{text}"
        "\n#pragma clang diagnostic pop\n"
    )
    path.write_text(wrapped, encoding="utf-8")
    return True


def patch_source(path: pathlib.Path) -> bool:
    """Silence deprecations inside .m/.c implementations too."""
    text = path.read_text(encoding="utf-8")
    if MARKER in text:
        return False
    if path.suffix not in {".m", ".c", ".mm"}:
        return False
    if "StoreKit" not in text and "SKProduct" not in text and "SKPayment" not in text:
        return False
    # Insert pragma after any leading comments / imports block start.
    wrapped = (
        f"/* {MARKER} */\n"
        "#pragma clang diagnostic push\n"
        '#pragma clang diagnostic ignored "-Wdeprecated-declarations"\n'
        f"{text}"
        "\n#pragma clang diagnostic pop\n"
    )
    path.write_text(wrapped, encoding="utf-8")
    return True


def iter_roots(explicit: list[str]) -> list[pathlib.Path]:
    roots: list[pathlib.Path] = []
    for item in explicit:
        p = pathlib.Path(item).expanduser().resolve()
        if p.exists():
            roots.append(p)
    if roots:
        return roots

    # Default: repo Flutter ephemeral + pub-cache (CI + local).
    here = pathlib.Path(__file__).resolve().parents[1]
    candidates = [
        here / "macos" / "Flutter" / "ephemeral",
        here / "ios" / "Flutter" / "ephemeral",
        pathlib.Path.home() / ".pub-cache" / "hosted",
        pathlib.Path.home() / "flutter" / ".pub-cache" / "hosted",
    ]
    return [c for c in candidates if c.exists()]


def main(argv: list[str]) -> int:
    roots = iter_roots(argv[1:])
    if not roots:
        print("silence_storekit_deprecations: no roots found (ok if flutter config-only not run yet)")
        return 0

    pkg_n = hdr_n = src_n = 0
    for root in roots:
        for path in root.rglob("*"):
            if not path.is_file() or not _is_iap_storekit_path(path):
                continue
            if path.name == "Package.swift":
                if patch_package_swift(path):
                    print(f"patched Package.swift: {path}")
                    pkg_n += 1
            elif path.suffix == ".h" and "/include/" in path.as_posix():
                if patch_header(path):
                    print(f"patched header: {path}")
                    hdr_n += 1
            elif path.suffix in {".m", ".c", ".mm"}:
                if patch_source(path):
                    print(f"patched source: {path}")
                    src_n += 1

    print(
        f"silence_storekit_deprecations: Package.swift={pkg_n} headers={hdr_n} sources={src_n}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
