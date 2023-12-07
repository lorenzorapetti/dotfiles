zmodload zsh/zprof

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # Fig pre block. Keep at the top of this file.
  [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
fi


export PATH="$HOME/bin:/opt/homebrew/bin:/usr/local/bin:/opt/homebrew/opt/make/libexec/gnubin:$PATH"

export FZF_BASE="/opt/homebrew/bin/fzf"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export SPACESHIP_CONFIG="$HOME/dotfiles/config/spaceship.zsh"
export ZSH="$HOME/.oh-my-zsh"

export GITHUB_TOKEN="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"

# Bun
export BUN_INSTALL="/Users/lorenzo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/lorenzo/Library/pnpm"

export ANDROID_HOME="$HOME/Library/Android/sdk"

export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:$HOME/flutter/bin"

eval "$(fnm env --use-on-cd)"

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

  iterm2_print_user_vars() {
      iterm2_set_user_var rubyVersion $(ruby -v | awk '{ print $2 }')
      iterm2_set_user_var nodeVersion $(node -v)
  }
  export STARSHIP_CONFIG="$HOME/.config/starship.toml"
else
  export STARSHIP_CONFIG="$HOME/.config/starship-warp.toml"
fi

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  ag
  aliases
  brew
  # colored-man-pages
  common-aliases
  fd
  fzf
  gh
  git
  node
  npm
  # nvm
  react-native
  rust
  # rvm
  sudo
  vscode
  yarn
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-interactive-cd
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias ls="lsd"
alias cat="bat"

alias ~="cd ~"
alias /="cd /"
alias ch="chezmoi"

alias b="brew"
alias bi="brew install"
alias bic="brew install --cask"
alias bu="brew update"
alias bo="brew outdated"

alias lg="lazygit"

alias c="cargo"

alias pn="pnpm"
alias pni="pnpm install"
alias pnd="pnpm run dev"
alias pns="pnpm run start"

alias vim="nvim"
alias vi="nvim"

alias mongo-start="mongod --config /opt/homebrew/etc/mongod.conf"

eval "$(starship init zsh)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # Fig post block. Keep at the bottom of this file.
  [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
fi
