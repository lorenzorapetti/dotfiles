# dotfiles-linux

My configuration for linux (Currently Arch Linux)

# Installation

- Install Arch (maybe with [aui](https://github.com/helmuthdu/aui)):

```bash
$ pacman -Sy git
$ git clone git://github.com/helmuthdu/aui
$ ./aui/fifo
```

- Install all programs (you need to be logged in as root):

```bash
$ pacman -S wget
$ wget https://raw.githubusercontent.com/loryman/dotfiles-linux/master/larbs.sh
$ chmod +x larbs.sh
$ sh larbs.sh
```

# Credits

- LARBS script: https://github.com/LukeSmithxyz/LARBS/
- Most of the config files: https://twily.info/
