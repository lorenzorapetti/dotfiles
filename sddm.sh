#!/usr/bin/env bash

set -euo pipefail

THEME_URL="https://github.com/catppuccin/sddm/releases/download/v1.1.2/catppuccin-mocha-lavender-sddm.zip"
THEME_ZIP="catppuccin-mocha-lavender-sddm.zip"
SDDM_THEMES_DIR="/usr/share/sddm/themes"
SDDM_CONF_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/sddm.conf"
SDDM_CONF_DEST="/etc/sddm.conf"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading SDDM theme..."
curl -L "$THEME_URL" -o "$TMP_DIR/$THEME_ZIP"

echo "Extracting SDDM theme..."
unzip -q "$TMP_DIR/$THEME_ZIP" -d "$TMP_DIR"

THEME_DIR=$(find "$TMP_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)

if [[ -z "$THEME_DIR" ]]; then
  echo "Error: could not find extracted SDDM theme directory." >&2
  exit 1
fi

echo "Installing SDDM theme to $SDDM_THEMES_DIR..."
sudo mv "$THEME_DIR" "$SDDM_THEMES_DIR/"

echo "Linking sddm.conf..."
 if [[ ! -f "$SDDM_CONF_SRC" ]]; then
  echo "Error: $SDDM_CONF_SRC not found." >&2
  exit 1
fi
sudo ln -sf "$SDDM_CONF_SRC" "$SDDM_CONF_DEST"
echo "Linked $SDDM_CONF_SRC -> $SDDM_CONF_DEST"

echo "Done! SDDM theme installed to $SDDM_THEMES_DIR/$(basename "$THEME_DIR")"
