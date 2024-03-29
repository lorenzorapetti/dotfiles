set fish_greeting
set TERM xterm-256color
set EDITOR nvim

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
fish_add_path -m $HOME/.bin $HOME/.local/bin /opt/homebrew/bin /opt/homebrew/opt /usr/local/bin $fish_user_paths

set PNPM_HOME $HOME/Library/pnpm
set ANDROID_HOME $HOME/Library/Android/sdk

fish_add_path $PNPM_HOME $HOME/.yarn/bin $fish_user_paths
fish_add_path /opt/homebrew/opt/openjdk@17/bin $fish_user_paths

#alias grep='rg'

alias reload='source $HOME/.config/fish/config.fish'

alias ls='lsd'
alias la='ls -la'

alias cat='bat'

alias ch='chezmoi'
alias chc='cd (chezmoi source-path)'
alias che='$EDITOR (chezmoi source-path)'

alias b='brew'
alias bi='brew install'
alias bic='brew install --cask'
alias bu='brew update'
alias bup='brew upgrade'
alias bo='brew outdated'

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

alias cfg="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

fnm env --use-on-cd | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

function brew
  command brew $argv

  if string match -q -r "upgrade" $argv; or string match -q -r "update" $argv; or string match -q -r "outdated" $argv
    sketchybar --trigger brew_update
  end
end
