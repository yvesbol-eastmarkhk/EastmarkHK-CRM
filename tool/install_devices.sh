#!/usr/bin/env bash
# Install EastmarkHK CRM on connected devices **without wiping local DB**.
#
# Android : adb install -r
# iOS     : xcrun devicectl device install app  (never `flutter install`)
#
# Usage:
#   bash tool/install_devices.sh              # macos + android + ios
#   bash tool/install_devices.sh --build
#   bash tool/install_devices.sh ios
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

export DEVELOPER_DIR="${DEVELOPER_DIR:-/Applications/Xcode.app/Contents/Developer}"
export GRADLE_USER_HOME="${GRADLE_USER_HOME:-$HOME/.gradle}"

TARGET="all"
DO_BUILD=0
for arg in "$@"; do
  case "$arg" in
    macos|android|ios|all) TARGET="$arg" ;;
    --build|-b) DO_BUILD=1 ;;
    -h|--help)
      sed -n '2,12p' "$0"
      exit 0
      ;;
  esac
done

APK="$ROOT/build/app/outputs/flutter-apk/app-release.apk"
IOS_APP="$ROOT/build/ios/iphoneos/Runner.app"
MAC_APP="$ROOT/build/macos/Build/Products/Release/EastmarkHK CRM.app"
MAC_APP_NAME="EastmarkHK CRM"

if [[ "$DO_BUILD" == "1" ]]; then
  if [[ "$TARGET" == "all" || "$TARGET" == "macos" ]]; then
    echo "==> flutter build macos --release"
    flutter build macos --release
  fi
  if [[ "${SKIP_ANDROID:-0}" != "1" && ("$TARGET" == "all" || "$TARGET" == "android") ]]; then
    echo "==> flutter build apk --release"
    flutter build apk --release || echo "warning: Android build failed — skipped"
  fi
  if [[ "$TARGET" == "all" || "$TARGET" == "ios" ]]; then
    echo "==> flutter build ios --release"
    flutter build ios --release
  fi
fi

install_macos() {
  if [[ ! -d "$MAC_APP" ]]; then
    echo "error: missing $MAC_APP — run with --build" >&2
    return 1
  fi
  echo "==> macOS : relaunch (keep data)"
  osascript -e "quit app \"$MAC_APP_NAME\"" 2>/dev/null || true
  sleep 1
  open "$MAC_APP"
}

install_android() {
  if [[ ! -f "$APK" ]]; then
    echo "warning: missing $APK — Android install skipped"
    return 0
  fi
  local serials
  serials="$(adb devices | awk 'NR>1 && $2=="device" {print $1}')"
  if [[ -z "$serials" ]]; then
    echo "warning: no Android device connected"
    return 0
  fi
  local s
  for s in $serials; do
    echo "==> Android $s : adb install -r (keep data)"
    adb -s "$s" install -r "$APK"
  done
}

install_ios() {
  if [[ ! -d "$IOS_APP" ]]; then
    echo "error: missing $IOS_APP — run with --build" >&2
    return 1
  fi
  local ids
  ids="$(
    flutter devices 2>/dev/null \
      | awk -F'•' '/ios/ {
          id=$2
          gsub(/^ +| +$/, "", id)
          if (id ~ /^[0-9A-Fa-f-]{20,}$/) print id
        }'
  )"
  if [[ -z "$ids" ]]; then
    echo "warning: no iOS device found (unlock device / same Wi‑Fi)"
    return 0
  fi
  local id
  for id in $ids; do
    echo "==> iOS $id : devicectl install (keep data — no uninstall)"
    xcrun devicectl device install app --device "$id" "$IOS_APP"
  done
}

case "$TARGET" in
  macos) install_macos ;;
  android) install_android ;;
  ios) install_ios ;;
  all)
    install_macos
    install_android
    install_ios
    ;;
esac

echo "Done. Databases preserved (Android -r / iOS in-place upgrade)."
