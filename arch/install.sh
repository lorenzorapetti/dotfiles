#!/bin/sh

sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

if [[ $DEBUG == 1 ]]; then
  set -x
fi

function check_and_link() {
  if [ -f "$2" ]; then
    mv $2 $2.old
  fi
  if [ -L "$2" ]; then
    rm -rf $2
  fi
  ln -s $1 $2
}

current_dir=$(pwd)
DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/dotfiles"}

# Install basic packages
sudo pacman -S --noconfirm --needed \
  base-devel \
  openssl \
  hub \
  ripgrep \
  fd \
  diff-so-fancy \
  kitty \
  bat \
  noto-fonts-emoji \
  powerline-fonts \
  zsh \
  fzf \
  lsd \
  ntfs-3g \
  brave \
  telegram-desktop

# Load git config
. $DOTFILES_PATH/common/load-git-config.sh

# Install YAY
git clone https://aur.archlinux.org/yay.git $HOME/yay
cd $HOME/yay
makepkg -si --noconfirm
cd $HOME
rm -rf $HOME/yay

# Install AUR packages
yay -S --noconfirm --needed \
  spotify \
  google-chrome \
  visual-studio-code-bin

# Install Oh My Zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

# Install Oh My Zsh plugins
. $DOTFILES_PATH/common/install-zsh-plugins.sh

# Install Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Load cargo
source $HOME/.cargo/env

# Install Rust packages
cargo install \
  starship \
  cargo-edit

# Install cargon subcommands
rustup component add clippy
rustup component add rustfmt

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install stable

# Update NPM
npm i -g npm

# Install global packages
npm i -g trash-cli

# Install Yarn
sudo pacman -S --noconfirm --needed yarn

# Link stuff
check_and_link "$DOTFILES_PATH/common/.zshrc" "$HOME/.zshrc"
check_and_link "$DOTFILES_PATH/common/.aliases" "$HOME/.aliases"
check_and_link "$DOTFILES_PATH/common/.config/starship.toml" "$HOME/.config/starship.toml"

# Load NVidia settings at login
cp "$DOTFILES_PATH/common/.config/autostart/load-nvidia-settings.desktop" "$HOME/.config/autostart/load-nvidia-settings.desktop"
sed -i "/Exec=/c\Exec=$DOTFILES_PATH/common/load-nvidia-settings.sh" $HOME/.config/autostart/load-nvidia-settings.desktop

# Set default shell to zsh
chsh -s $(which zsh)

echo -e "\\n\\n\033[1m\033[1mFinished!\\nNow all you have to do is logout and login again \033[0m✨"

unset current_dir DOTFILES_PATH
