#!/bin/sh
# Xcode Cloud — after clone (macOS).
# Ce projet utilise Swift Package Manager (pas de Podfile / CocoaPods).
# Aligné Flutter local : 3.47.0-0.4.pre (channel beta).
set -euo pipefail

cd "$CI_PRIMARY_REPOSITORY_PATH"

FLUTTER_VERSION="${FLUTTER_VERSION:-3.47.0-0.4.pre}"
FLUTTER_ZIP="flutter_macos_arm64_${FLUTTER_VERSION}-beta.zip"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/beta/macos/${FLUTTER_ZIP}"

echo "==> Installing Flutter ${FLUTTER_VERSION} (beta arm64 zip)…"
curl -fsSL -o "/tmp/${FLUTTER_ZIP}" "$FLUTTER_URL"
rm -rf "$HOME/flutter"
unzip -qq "/tmp/${FLUTTER_ZIP}" -d "$HOME"
export PATH="$PATH:$HOME/flutter/bin"
git config --global --add safe.directory "$HOME/flutter" || true
flutter --version

echo "==> flutter precache --macos"
flutter precache --macos

echo "==> flutter pub get"
flutter pub get

echo "==> flutter build macos --config-only"
flutter build macos --config-only --release

echo "==> silence_storekit_deprecations (post-clone macos)"
python3 tool/silence_storekit_deprecations.py \
  "$CI_PRIMARY_REPOSITORY_PATH/macos/Flutter/ephemeral" \
  "${PUB_CACHE:-$HOME/.pub-cache}/hosted" \
  || true

echo "==> ci_post_clone (macos) OK"
exit 0
