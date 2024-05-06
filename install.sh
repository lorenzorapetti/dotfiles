#!/usr/bin/env sh

check_program() {
	if ! command -v $1 &> /dev/null; then
		echo "Command $1 could not be found"
		exit 1
	fi
}

# Get platform name in lowercase
platform="$(uname | tr '[:upper:]' '[:lower:]')"

# Check if the platform is one of the supported ones
if [[ "$platform" != "darwin" && "$platform" != "linux" ]]; then
	echo "Platform $platform not supported"
	exit 1
fi

check_program "git"
check_program "stow"
check_program "make"

git clone git@github.com:lorenzorapetti/dotfiles.git $HOME/.dotfiles

make $platform
