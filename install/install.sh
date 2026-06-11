#!/usr/bin/env bash

trap 'echo "Aborted."; exit 1' INT

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install the base packages needed to bootstrap paru
sudo pacman -Sq --needed --noconfirm \
  base-devel \
  git \
  rustup

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
else
  echo "paru already installed, skipping..."
fi

# Install all packages listed in a .packages file with paru.
# Comments (lines starting with #) and blank lines are ignored.
install_packages() {
  local file="$1"
  local packages
  mapfile -t packages < <(grep -v '^#' "$file" | grep -v '^$')

  paru -S --needed --noconfirm "${packages[@]}" || exit 1

  for pkg in "${packages[@]}"; do
    # Secondary check to handle states where paru doesn't actually register an error
    if ! pacman -Q "$pkg" &>/dev/null; then
      echo -e "\033[31mError: Package '$pkg' did not install\033[0m" >&2
      exit 1
    fi
  done
}

install_packages "$SCRIPT_DIR/packages/base.packages"
install_packages "$SCRIPT_DIR/packages/gui.packages"
install_packages "$SCRIPT_DIR/packages/aur.packages"

# Install mise
if ! command -v mise &>/dev/null; then
  curl https://mise.run | MISE_QUIET=1 sh
else
  echo "mise already installed, skipping..."
fi

# Install SDDM Theme
. ./sddm.sh

xdg-user-dirs-update

git clone https://github.com/lorenzorapetti/nvim ~/.config/nvim

stow --target="$HOME" common
stow --target="$HOME" linux

# Change this if you're using a different shell
systemctl --user enable wayle.service

systemctl --user enable vicinae.service
systemctl --user enable udiskie.service
systemctl --user enable ssh-add.service
