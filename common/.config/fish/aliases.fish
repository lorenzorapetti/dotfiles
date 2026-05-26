if type -q eza
    alias ls='eza'
end

if type -q bat
    alias cat='bat'
else if type -q batcat
    alias cat='batcat'
end

if type -q lazygit
    alias lg='lazygit'
end

if type -q cargo
    alias c='cargo'
end

if type -q dust
    alias du='dust'
end

if type -q brew
    alias b="brew"
    alias bi="brew install"
    alias bo="brew outdated"
    alias bu="brew update"
    alias bup="brew upgrade"
end

alias la='ls -la'
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
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate --all'
alias gld='git log --pretty=format:"%C(yellow)%h%C(reset) - %an [%C(green)%ar%C(reset)] %s"'

alias v='nvim'

alias reload='source $HOME/.config/fish/config.fish'
