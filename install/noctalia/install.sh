#!/usr/bin/env bash

set -euo pipefail

CONF_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NOCTALIA_GREETER_CONF_DEST="/var/lib/noctalia-greeter/greeter.conf"
GREETD_CONF_DEST="/etc/greetd/config.toml"
PAM_DEST="/etc/pam.d/greetd"

sudo ln -sf "$CONF_SRC/noctalia-greeter.conf" "$NOCTALIA_GREETER_CONF_DEST"
sudo ln -sf "$CONF_SRC/greetd.toml" "$GREETD_CONF_DEST"
sudo ln -sf "$CONF_SRC/pam" "$PAM_DEST"
