#!/bin/sh
# Xcode Cloud — runs after clone (macOS workflow).
# Aligné Flutter local : 3.47.0-0.3.pre (channel beta).
set -euo pipefail

cd "$CI_PRIMARY_REPOSITORY_PATH"

FLUTTER_VERSION="${FLUTTER_VERSION:-3.47.0-0.3.pre}"
FLUTTER_ZIP="flutter_macos_${FLUTTER_VERSION}-beta.zip"
FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/beta/macos/${FLUTTER_ZIP}"

echo "==> Installing Flutter ${FLUTTER_VERSION} (beta zip)…"
curl -fsSL -o "/tmp/${FLUTTER_ZIP}" "$FLUTTER_URL"
rm -rf "$HOME/flutter"
unzip -qq "/tmp/${FLUTTER_ZIP}" -d "$HOME"
export PATH="$PATH:$HOME/flutter/bin"
git config --global --add safe.directory "$HOME/flutter" || true

echo "==> flutter precache --macos"
flutter precache --macos

echo "==> flutter pub get"
flutter pub get

echo "==> CocoaPods (macos)"
HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods
cd macos
pod install

echo "==> ci_post_clone (macos) OK"
exit 0
