# dotfiles-linux

My configuration for the various linux distributions

# What does this script do?

It clones the repo into `$HOME/dotfiles` and installs the following things:

Programs:

- git
- ripgrep
- fd
- zsh (with Oh My Zsh and starship prompt)
- zsh-completions
- zsh-syntax-highlighting
- fzf
- ntfs-3g

Programming languages:

- Rust (with cargo, cargo-edit, rustfmt and clippy)
- Nodejs (with nvm, npm and yarn)

Applications:

- Brave browser
- Spotify
- Telegram Desktop
- Google Chrome
- Visual Studio Code

Additionally, it links:

- `<dotfiles-path>/<distro>/.zshrc` to `$HOME/.zshrc`
- `<dotfiles-path>/<distro>/.config/starship.toml` to `$HOME/.config/starship.toml`

# Distro support

| Distro                         | \$DISTRO env variable |
| ------------------------------ | --------------------- |
| Arch (Including Manjaro, etc.) | `arch` (default)      |
| macOS                          | `mac`                 |

# Usage

For a basic installation (Arch based):

```bash
$ curl -s https://raw.githubusercontent.com/loryman/dotfiles-linux/master/install.sh | bash
```

For any other distro:

```bash
$ curl -s https://raw.githubusercontent.com/loryman/dotfiles-linux/master/install.sh | DISTRO=<distro-keyword> bash
```
