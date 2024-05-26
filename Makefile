MAC_PACKAGES = aerospace alacritty alacritty-macos fish git nvim tmux starship
LINUX_PACKAGES = alacritty alacritty-linux fish nvim tmux starship

darwin:
	stow --verbose --target=$$HOME --restow $(MAC_PACKAGES)

linux:
	stow --verbose --target=$$HOME --restow $(LINUX_PACKAGES)

delete:
	stow --verbose --target=$$HOME --delete */
