DISTRO=${DISTRO:-arch}
dotfiles_path="$HOME/dotfiles"

function err_and_exit() {
  echo $1 1>&2
  exit 1
}

# Check if the dotfiles repo exists
if [ -d "$dotfiles_path" ]; then
  err_and_exit "The dotfiles repo already exists"
fi

# Install git
case "$DISTRO" in
arch)
  sudo pacman -S --noconfirm --needed git
  ;;
*)
  err_and_exit "$DISTRO is not supported"
  ;;
esac

git clone https://github.com/loryman/dotfiles-linux.git $dotfiles_path
DOTFILES_PATH=$dotfiles_path $dotfiles_path/$DISTRO/install.sh

unset DISTRO dotfiles_path
