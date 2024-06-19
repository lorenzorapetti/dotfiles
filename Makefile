MAC_PACKAGES = aerospace alacritty fish git nvim tmux starship
LINUX_PACKAGES = alacritty fish nvim tmux starship scripts-linux hyprland waybar rofi swaync kitty mpv

darwin:
	stow --verbose --target=$$HOME --restow $(MAC_PACKAGES)
	stow --verbose --target=$$HOME --restow $(MAC_PACKAGES) alacritty-macos

linux:
	stow --verbose --target=$$HOME --restow $(LINUX_PACKAGES)
	stow --verbose --target=$$HOME --restow $(LINUX_PACKAGES) alacritty-linux

delete:
	stow --verbose --target=$$HOME --delete */
