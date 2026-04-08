#!/usr/bin/env bash

trap 'echo "Aborted."; exit 1' INT

sudo pacman -Sq --needed --noconfirm \
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
	direnv \
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
	ttf-jetbrains-mono-nerd \
	otf-geist-mono-nerd \
	ttf-liberation \
	otf-fira-sans \
	otf-montserrat \
	noto-fonts \
	noto-fonts-cjk \
	noto-fonts-emoji \
	noto-fonts-extra \
	ttf-opensans \
	ttf-roboto \
	ttf-roboto-mono \
	adobe-source-sans-fonts \
	qt6-svg \
	qt6-declarative \
	qt5-quickcontrols2 \
	sddm \
	firefox \
	ghostty

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
	ttf-mac-fonts \
	otf-openmoji \
	ttf-twemoji \
	1password \
	1password-cli

# Install SDDM Theme
# . ./sddm.sh
