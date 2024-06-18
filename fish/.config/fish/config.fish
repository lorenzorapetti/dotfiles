set fish_greeting
set TERM xterm-256color
set EDITOR nvim

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
fish_add_path -m $HOME/.local/share/bob/nvim-bin $HOME/.bin $HOME/.local/bin /usr/local/bin $fish_user_paths

set PNPM_HOME $HOME/Library/pnpm
set ANDROID_HOME $HOME/Library/Android/sdk

if test -f ./secrets.fish
	./secrets.fish
end

set os $(uname | tr '[:upper:]' '[:lower:]')

if [ "$os" = "darwin" ]
	fish_add_path /opt/homebrew/bin /opt/homebrew/opt
	fish_add_path /opt/homebrew/opt/openjdk@17/bin $fish_user_paths
end

fish_add_path $PNPM_HOME $HOME/.yarn/bin $fish_user_paths
fish_add_path /usr/local/go/bin $fish_user_path
fish_add_path $fish_user_path $HOME/.config/rofi/scripts

if test -f $HOME/.cargo/env.fish
	source "$HOME/.cargo/env.fish"
end

alias reload='source $HOME/.config/fish/config.fish'

alias ls='lsd'
alias la='ls -la'

alias cat='bat'

if [ "$os" = "darwin" ]
	alias b='brew'
	alias bi='brew install'
	alias bic='brew install --cask'
	alias bu='brew update'
	alias bup='brew upgrade'
	alias bo='brew outdated'
end

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gp='git push'
alias lg='lazygit'

alias c='cargo'

alias pn='pnpm'
alias pni='pnpm install'
alias pnd='pnpm run dev'
alias pns='pnpm run start'

alias nrd='npm run dev'

alias vim='nvim'
alias vi='nvim'
alias lvim="NVIM_APPNAME=nvim-lazy $HOME/.local/share/bob/nightly/nvim-macos-arm64/bin/nvim"

alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias cfl="lazygit $HOME --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

fnm env --use-on-cd | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

starship init fish | source
