set fish_greeting
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx MANPAGER "bat -plman"
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
set -gx TODO_DIR $HOME/notes

# Default + export THEME if not already set (inherited env stays as-is, already exported)
set -q THEME[1]; or set -gx THEME catppuccin-mocha

# Map theme -> color mode. Listed themes pass --color-theme; others omit it.
switch $THEME
    case catppuccin-mocha everforest-soft-dark
        set -f _mode dark
    case '*'
        set -f _mode ''
end

if test -n "$_mode"
    fish_config theme choose $THEME --color-theme=$_mode
else
    fish_config theme choose $THEME
end

source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/utils.fish

fish_add_path -g $HOME/.cargo/bin

set -Ux SUDO_ASKPASS ~/.local/bin/notify-askpass
alias sudo="sudo -A"

$HOME/.local/bin/mise activate fish | source

fzf --fish | source

zoxide init fish | source

direnv hook fish | source

set -gx ATUIN_NOBIND true
atuin init fish | source

# Bind to ctrl-r in normal and insert mode, add any other bindings you want here too
tv init fish | source

function zellij_layouts
    tv zellij
end

bind alt-r zellij_layouts

starship init fish | source
