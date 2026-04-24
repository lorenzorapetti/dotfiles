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
  rustup \
  poppler \
  bat \
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
  lua-language-server \
  bash-language-server \
  stylua \
  shfmt \
  neovim \
  fish \
  starship \
  atuin \
  stow \
  hyprland \
  hyprshutdown \
  hyprpolkitagent \
  hypridle \
  hyprlock \
  dunst \
  v4l-utils \
  grim \
  slurp \
  satty \
  gpu-screen-recorder \
  imv \
  mpv \
  xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk \
  waybar \
  awww \
  pipewire \
  pipewire-alsa \
  pipewire-pulse \
  wireplumber \
  wiremix \
  pavucontrol \
  brightnessctl \
  bluez \
  bluez-utils \
  blueman \
  nm-connection-editor \
  network-manager-applet \
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
  qt5ct \
  qt6ct \
  qt6-svg \
  qt6-declarative \
  qt5-quickcontrols2 \
  qt5-wayland \
  qt6-wayland \
  gnome-keyring \
  sddm \
  firefox \
  ghostty

# Install Rust
rustup update stable

# Install Paru (AUR helper)
if ! command -v paru &>/dev/null; then
  PARU_TMP=$(mktemp -d)
  git clone https://aur.archlinux.org/paru.git "$PARU_TMP/paru"
  pushd "$PARU_TMP/paru"
  makepkg -si -d
  popd
  rm -rf "$PARU_TMP"

  echo "paru already installed, skipping..."
fi

# Install mise
if ! command -v mise &>/dev/null; then
  curl https://mise.run | MISE_QUIET=1 sh
else
  echo "mise already installed, skipping..."
fi

paru -S --needed --noconfirm \
  frameworkintegration \
  gtk-engine-murrine \
  adwaita-fonts \
  ttf-mac-fonts \
  otf-openmoji \
  ttf-twemoji \
  darkly \
  catppuccin-qt5ct-git \
  catppuccin-cursors-mocha \
  docker-language-server \
  bluetuith-bin \
  wleave \
  1password \
  1password-cli \
  vicinae-bin \
  helium-browser-bin \
  telegram-desktop \
  vesktop \
  slack-desktop \
  teams-for-linux \
  obs-studio

# Install SDDM Theme
# . ./sddm.sh
