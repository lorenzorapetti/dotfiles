if [[ $DEBUG == 1 ]]; then
  set -x
fi

current_dir=$(pwd)

# Install basic packages
sudo pacman -S --noconfirm \
  git \
  ripgrep \
  fd \
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

# Install YAY
git clone https://aur.archlinux.org/yay.git $HOME/yay
cd $HOME/yay
makepkg -si --noconfirm
cd $HOME
rm -rf $HOME/yay

# Install AUR packages
yay -S --noconfirm \
  spotify \
  google-chrome

# Install Oh My Zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

# Install Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Install Rust packages
cargo install starship

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install stable

# Update NPM
npm i -g npm

# Install Yarn
sudo pacman -S --noconfirm yarn

# Link stuff
ln -s $(pwd)/.zshrc $HOME/.zshrc
ln -s $(pwd)/.config/starship.toml $HOME/.config/starship.toml

# Set default shell to zsh
chsh -s $(which zsh)

echo -e "\\n\\n\033[1m\033[1mFinished\!\\nNow all you have to do is logout and login again \033[0m✨"
