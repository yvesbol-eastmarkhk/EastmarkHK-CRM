#!/bin/sh
# Xcode Cloud — just before xcodebuild (macOS).
# Silence Flutter IAP StoreKit 1 deprecation noise (plugin issue #170442).
set -euo pipefail

cd "$CI_PRIMARY_REPOSITORY_PATH"

echo "==> silence_storekit_deprecations (pre-xcodebuild macos)"
python3 tool/silence_storekit_deprecations.py \
  "$CI_PRIMARY_REPOSITORY_PATH/macos/Flutter/ephemeral" \
  "${PUB_CACHE:-$HOME/.pub-cache}/hosted" \
  || true

echo "==> ci_pre_xcodebuild (macos) OK"
exit 0
