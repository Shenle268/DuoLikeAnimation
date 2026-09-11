#!/bin/bash
set -euo pipefail
xcodebuild -project DuoLikeAnimation.xcodeproj -scheme DuoLikeAnimation -configuration Release -sdk iphoneos -destination 'generic/platform=iOS' -derivedDataPath build CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO COMPILER_INDEX_STORE_ENABLE=NO build
APP="$(find build/Build/Products/Release-iphoneos -maxdepth 1 -name '*.app' -type d | head -1)"
rm -rf Payload DuoLikeAnimation-iPad.ipa
mkdir Payload
cp -R "$APP" Payload/
codesign --force --deep --sign - "Payload/$(basename "$APP")"
ditto -c -k --sequesterRsrc --keepParent Payload DuoLikeAnimation-iPad.ipa
rm -rf Payload
echo "Created DuoLikeAnimation-iPad.ipa"
