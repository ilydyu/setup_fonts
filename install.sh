#!/bin/bash

set -e


for cmd in wget unzip fc-cache; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: The utility '$cmd' is not installed. Please install it and try again."
        exit 1
    fi
done

MONOSPACE_FONT_NAME="Monospace Neon"
MONOSPACE_FONT_URL="https://github.com/githubnext/monaspace/releases/download/v1.101/monaspace-v1.101.zip"

SANS_SERIF_FONT_NAME="Manrope"
SANS_SERIF_FONT_URL="https://github.com/davelab6/manrope/archive/refs/heads/master.zip"

SERIF_FONT_NAME="Merriweather"
SERIF_FONT_URL="https://github.com/SorkinType/Merriweather/archive/refs/heads/master.zip"

FONT_DIR="$HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"

mkdir -p "$FONT_DIR/$MONOSPACE_FONT_NAME/otf"
mkdir -p "$FONT_DIR/$MONOSPACE_FONT_NAME/webfonts"

mkdir -p "$FONT_DIR/$SANS_SERIF_FONT_NAME/otf"
mkdir -p "$FONT_DIR/$SANS_SERIF_FONT_NAME/webfonts"

mkdir -p "$FONT_DIR/$SERIF_FONT_NAME/otf"
mkdir -p "$FONT_DIR/$SERIF_FONT_NAME/webfonts"

wget -O "/tmp/$MONOSPACE_FONT_NAME.zip" "$MONOSPACE_FONT_URL"
wget -O "/tmp/$SANS_SERIF_FONT_NAME.zip" "$SANS_SERIF_FONT_URL"
wget -O "/tmp/$SERIF_FONT_NAME.zip" "$SERIF_FONT_URL"

unzip -o "/tmp/$MONOSPACE_FONT_NAME.zip" -d "/tmp/$MONOSPACE_FONT_NAME"
unzip -o "/tmp/$SANS_SERIF_FONT_NAME.zip" -d "/tmp/$SANS_SERIF_FONT_NAME"
unzip -o "/tmp/$SERIF_FONT_NAME.zip" -d "/tmp/$SERIF_FONT_NAME"

find "/tmp/$MONOSPACE_FONT_NAME/monaspace-v1.101/fonts/otf" -name "*.otf" -exec cp {} "$FONT_DIR/$MONOSPACE_FONT_NAME/otf" \;
find "/tmp/$MONOSPACE_FONT_NAME/monaspace-v1.101/fonts/woff2" -name "*.woff2" -exec cp {} "$FONT_DIR/$MONOSPACE_FONT_NAME/webfonts" \;

find "/tmp/$SANS_SERIF_FONT_NAME/manrope-master/desktop font" -name "*.otf" -exec cp {} "$FONT_DIR/$SANS_SERIF_FONT_NAME/otf" \;
find "/tmp/$SANS_SERIF_FONT_NAME/manrope-master/web font" -name "*.woff2" -exec cp {} "$FONT_DIR/$SANS_SERIF_FONT_NAME/webfonts" \;

find "/tmp/$SERIF_FONT_NAME/Merriweather-master/fonts/otf" -name "*.otf" -exec cp {} "$FONT_DIR/$SERIF_FONT_NAME/otf" \;
find "/tmp/$SERIF_FONT_NAME/Merriweather-master/fonts/webfonts" -name "*.woff2" -exec cp {} "$FONT_DIR/$SERIF_FONT_NAME/webfonts" \;

fc-cache -fv

rm -rf "/tmp/$MONOSPACE_FONT_NAME" "/tmp/$SANS_SERIF_FONT_NAME" "/tmp/$SERIF_FONT_NAME"
rm "/tmp/$MONOSPACE_FONT_NAME.zip" "/tmp/$SANS_SERIF_FONT_NAME.zip" "/tmp/$SERIF_FONT_NAME.zip"

echo "Fonts $MONOSPACE_FONT_NAME, $SANS_SERIF_FONT_NAME, $SERIF_FONT_NAME were installed successfully."
