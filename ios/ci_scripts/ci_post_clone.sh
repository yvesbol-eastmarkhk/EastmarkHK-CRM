#!/bin/sh
# Xcode Cloud — after clone (iOS).
# Ce projet utilise Swift Package Manager (pas de Podfile / CocoaPods).
# Aligné Flutter local : 3.47.0-0.4.pre (channel beta).
set -euo pipefail

cd "$CI_PRIMARY_REPOSITORY_PATH"

FLUTTER_VERSION="${FLUTTER_VERSION:-3.47.0-0.4.pre}"
# Xcode Cloud = Apple Silicon → zip arm64
FLUTTER_ZIP="flutter_macos_arm64_${FLUTTER_VERSION}-beta.zip"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/beta/macos/${FLUTTER_ZIP}"

echo "==> Installing Flutter ${FLUTTER_VERSION} (beta arm64 zip)…"
curl -fsSL -o "/tmp/${FLUTTER_ZIP}" "$FLUTTER_URL"
rm -rf "$HOME/flutter"
unzip -qq "/tmp/${FLUTTER_ZIP}" -d "$HOME"
export PATH="$PATH:$HOME/flutter/bin"
git config --global --add safe.directory "$HOME/flutter" || true
flutter --version

echo "==> flutter precache --ios"
flutter precache --ios

echo "==> flutter pub get"
flutter pub get

echo "==> flutter build ios --config-only (SPM / Generated.xcconfig)"
flutter build ios --config-only --release

echo "==> silence_storekit_deprecations (post-clone ios)"
python3 tool/silence_storekit_deprecations.py \
  "$CI_PRIMARY_REPOSITORY_PATH/ios/Flutter/ephemeral" \
  "${PUB_CACHE:-$HOME/.pub-cache}/hosted" \
  || true

echo "==> ci_post_clone (ios) OK"
exit 0
