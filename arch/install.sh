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
  ripgrep \
  fd \
  noto-fonts-emoji \
  powerline-fonts \
  zsh \
  zsh-completions \
  zsh-syntax-highlighting \
  fzf \
  ntfs-3g \
  brave \
  telegram-desktop

git config --global user.email "lorenzo.rapetti.94@gmail.com"
git config --global user.name "Lorenzo Rapetti"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

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

# Install Yarn
sudo pacman -S --noconfirm --needed yarn

# Link stuff
check_and_link "$DOTFILES_PATH/arch/.zshrc" "$HOME/.zshrc"
check_and_link "$DOTFILES_PATH/arch/.config/starship.toml" "$HOME/.config/starship.toml"

# Set default shell to zsh
chsh -s $(which zsh)

echo -e "\\n\\n\033[1m\033[1mFinished!\\nNow all you have to do is logout and login again \033[0m✨"

unset current_dir DOTFILES_PATH
