set fish_greeting
set TERM xterm-256color
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config

fish_config theme choose catppuccin-mocha --color-theme=dark

source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/utils.fish

fish_add_path $HOME/.cargo/bin

$HOME/.local/bin/mise activate fish | source

fzf --fish | source

zoxide init fish | source

direnv hook fish | source

set -gx ATUIN_NOBIND true
atuin init fish | source

# Bind to ctrl-r in normal and insert mode, add any other bindings you want here too
bind \cr _atuin_search
bind -M insert \cr _atuin_search

starship init fish | source
