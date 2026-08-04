#!/usr/bin/env bash
# Build release APK → dist/apk/
#
# Usage:
#   bash tool/build_apk.sh
#   SKIP_BUILD=1 bash tool/build_apk.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

VERSION_LINE="$(grep '^version:' "$ROOT/pubspec.yaml" | head -1 | awk '{print $2}')"
MARKETING="${VERSION_LINE%%+*}"
BUILD="${VERSION_LINE##*+}"

SRC_APK="$ROOT/build/app/outputs/flutter-apk/app-release.apk"
DIST_DIR="$ROOT/dist/apk"
DIST_APK="$DIST_DIR/EastmarkHK-CRM-${MARKETING}-android.apk"

SKIP_BUILD="${SKIP_BUILD:-0}"

if [[ "$SKIP_BUILD" != "1" ]]; then
  echo "==> flutter build apk --release"
  flutter build apk --release
fi

if [[ ! -f "$SRC_APK" ]]; then
  echo "error: missing $SRC_APK" >&2
  exit 1
fi

mkdir -p "$DIST_DIR"
cp -f "$SRC_APK" "$DIST_APK"
cp -f "$SRC_APK" "$DIST_DIR/EastmarkHK-CRM-android.apk"

echo
echo "APK ready:"
echo "  $DIST_APK"
echo "  $DIST_DIR/EastmarkHK-CRM-android.apk"
echo "  version ${MARKETING} (${BUILD})"
