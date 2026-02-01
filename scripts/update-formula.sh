#!/bin/bash
# Update Homebrew formula with new release information
# 
# Usage: ./scripts/update-formula.sh <project> <version> <tarball-url>
# 
# Example: ./scripts/update-formula.sh clio 20260201.2 \
#   https://github.com/SyntheticAutonomicMind/CLIO/releases/download/20260201.2/clio-20260201.2.tar.gz

set -e

if [ $# -ne 3 ]; then
    echo "Usage: $0 <project> <version> <tarball-url>"
    echo ""
    echo "Example:"
    echo "  $0 clio 20260201.2 https://github.com/SyntheticAutonomicMind/CLIO/releases/download/20260201.2/clio-20260201.2.tar.gz"
    exit 1
fi

PROJECT=$1
VERSION=$2
URL=$3

FORMULA="Formula/${PROJECT}.rb"

if [ ! -f "$FORMULA" ]; then
    echo "[ERROR] Formula not found: $FORMULA"
    exit 1
fi

echo "[*] Updating $FORMULA"
echo "[*] Version: $VERSION"
echo "[*] URL: $URL"

# Download the tarball and calculate SHA256
echo "[*] Downloading tarball..."
TEMP_FILE="/tmp/${PROJECT}-${VERSION}.tar.gz"
curl -L -o "$TEMP_FILE" "$URL" 2>/dev/null

echo "[*] Calculating SHA256..."
SHA256=$(shasum -a 256 "$TEMP_FILE" | cut -d' ' -f1)
echo "[*] SHA256: $SHA256"

# Update the formula
echo "[*] Updating formula..."
sed -i.bak "s|url .*|url \"$URL\"|" "$FORMULA"
sed -i.bak "s|sha256 .*|sha256 \"$SHA256\"|" "$FORMULA"
rm -f "$FORMULA.bak"

# Show what changed
echo ""
echo "[OK] Formula updated. Changes:"
echo "---"
grep -E "url|sha256" "$FORMULA"
echo "---"

# Cleanup
rm -f "$TEMP_FILE"

echo ""
echo "[OK] To test the formula:"
echo "  brew install -s ./$FORMULA"
echo ""
echo "[OK] To commit:"
echo "  git add $FORMULA"
echo "  git commit -m \"chore($PROJECT): update to $VERSION\""
