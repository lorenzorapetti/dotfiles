# For profiling zsh
# Use the command `zprof` to see the dump
zmodload zsh/zprof

autoload -Uz compinit

case $SYSTEM in
Darwin)
  if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit
  else
    compinit -C
  fi
  ;;
esac

zmodload -i zsh/complist

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups                                                 # remove older duplicate entries from history
setopt hist_reduce_blanks                                                   # remove superfluous blanks from history items
setopt inc_append_history                                                   # save history entries as soon as they are entered
setopt share_history                                                        # share history between different instances of the shell
setopt auto_cd                                                              # cd by typing directory name if it's not a command
setopt correct_all                                                          # autocorrect commands
setopt auto_list                                                            # automatically list choices on ambiguous completion
setopt auto_menu                                                            # automatically use menu completion
setopt always_to_end                                                        # move cursor to end if word had one match

zstyle ':completion:*' menu select                                          # select completions with arrow keys
zstyle ':completion:*' group-name ''                                        # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

# Load stuff
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh

# # better yaourt colors
# export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

export PATH="$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$PATH"
export NVM_LAZY_LOAD=true

if [ -e $HOME/.zsh_plugins.sh ]; then
  source $HOME/.zsh_plugins.sh
else
  antibody bundle <$HOME/.zsh/plugins.txt >$HOME/.zsh_plugins.sh
  chmod +x $HOME/.zsh_plugins.sh
  source $HOME/.zsh_plugins.sh
fi

# Load starship prompt theme
eval "$(starship init zsh)"
