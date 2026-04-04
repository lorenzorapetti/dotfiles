#!/usr/bin/env bash

trap 'echo "Aborted."; exit 1' INT
set -euo pipefail

sudo pacman -Sq --needed --noconfirm \
	# Terminal stuff
	base-devel \
	wget \
	curl \
	git \
	ffmpeg \
	cairo \
	pango \
	7zip \
	poppler \
	fd \
	ripgrep \
	jq \
	fzf \
	zoxide \
	eza \
	resvg \
	imagemagick \
	wl-clipboard \
	chafa \
	btop \
	lazygit \
	lazydocker \
	yazi \
	neovim \
	fish \
	starship \
	atuin \
	stow \

	# GUI stuff
	qt6-svg \
	qt6-declarative \
	qt5-quickcontrols2 \
	sddm \

	# Applications
	firefox
	2>&1 | grep -v "is up to date -- skipping"

# Install Rustup
if ! command -v rustup &> /dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
	. "$HOME/.cargo/env"
else
	echo "rustup already installed, skipping..."
fi

# Install Paru (AUR helper)
if ! command -v paru &> /dev/null; then
	PARU_TMP=$(mktemp -d)
	git clone https://aur.archlinux.org/paru.git "$PARU_TMP/paru"
	pushd "$PARU_TMP/paru"
	makepkg -si -d
	popd
	rm -rf "$PARU_TMP"
else
	echo "paru already installed, skipping..."
fi

# Install mise
if ! command -v mise &> /dev/null; then
	curl https://mise.run | MISE_QUIET=1 sh
else
	echo "mise already installed, skipping..."
fi

paru -S --needed --noconfirm \
	1password \
	1password-cli

# Install SDDM Theme
. ./sddm.sh
