#!/usr/bin/env bash

set -euo pipefail

# Disable USB autosuspend on the Bluetooth radio to stop random A2DP dropouts.
BTUSB_CONF_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/btusb.conf"
BTUSB_CONF_DEST="/etc/modprobe.d/btusb.conf"

echo "Linking btusb.conf..."
sudo ln -sf "$BTUSB_CONF_SRC" "$BTUSB_CONF_DEST"
echo "Linked $BTUSB_CONF_SRC -> $BTUSB_CONF_DEST"
