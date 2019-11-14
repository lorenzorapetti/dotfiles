# dotfiles

My configuration for the various OSes i use.

# What does this script do?

TODO

# Distro support

| Distro                         | \$DISTRO env variable |
| ------------------------------ | --------------------- |
| Arch (Including Manjaro, etc.) | `arch` (default)      |
| macOS                          | `mac`                 |

# Usage

For a basic installation (Arch based):

```bash
$ curl -s https://raw.githubusercontent.com/loryman/dotfiles-linux/master/install.sh | sh
```

For any other distro:

```bash
$ curl -s https://raw.githubusercontent.com/loryman/dotfiles-linux/master/install.sh | DISTRO=<distro-keyword> sh
```
