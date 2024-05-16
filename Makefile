MAC_PACKAGES = aerospace alacritty fish git nvim tmux
LINUX_PACKAGES = alacritty fish nvim tmux

darwin:
	for package in $(MAC_PACKAGES); do \
		stow --verbose --target=$$HOME --restow $$package \
	done

linux:
	for package in $(LINUX_PACKAGES); do \
		stow --verbose --target=$$HOME --restow $$package \
	done

delete:
	stow --verbose --target=$$HOME --delete */
