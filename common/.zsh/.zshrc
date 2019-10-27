export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PURE_PROMPT_SYMBOL='λ'
export ZSHCONFIG=$ZDOTDIR
export ZCOMPDUMP_FOLDER=$ZDOTDIR/compdump
export QMK_HOME="$HOME/code/qmk_firmware"

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

autoload -Uz compinit

case $SYSTEM in
Darwin)
  if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' $ZCOMPDUMP_FOLDER/.zcompdump) ]; then
    compinit -d $ZCOMPDUMP_FOLDER/.zcompdump
  else
    compinit -C -d $ZCOMPDUMP_FOLDER/.zcompdump
  fi
  ;;
esac

source $ZDOTDIR/init.sh
