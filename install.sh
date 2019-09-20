#!/bin/bash

DISTRO=${DISTRO:-arch}
DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/dotfiles"}

function err_and_exit() {
  echo $1 1>&2
  exit 1
}

# Check if the dotfiles repo exists
if [ -d "$DOTFILES_PATH" ]; then
  err_and_exit "The dotfiles repo already exists"
fi

# Install git
case "$DISTRO" in
arch)
  sudo pacman -S --noconfirm --needed git
  ;;
mac) ;;
*)
  err_and_exit "$DISTRO is not supported"
  ;;
esac

git clone https://github.com/loryman/dotfiles-linux.git $DOTFILES_PATH
DOTFILES_PATH=$DOTFILES_PATH $DOTFILES_PATH/$DISTRO/install.sh

unset DISTRO DOTFILES_PATH
