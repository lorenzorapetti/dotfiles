#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

source ${ZSHCONFIG}/antibody-init.zsh
source ${ZSHCONFIG}/antibody-managed-plugins.zsh

#-----------------------------------------------------
# Setting autoloaded functions
#
my_zsh_fpath=${ZSHCONFIG}/autoloaded

fpath=($my_zsh_fpath $fpath)

if [[ -d "$my_zsh_fpath" ]]; then
    for func in $my_zsh_fpath/*; do
        autoload -Uz ${func:t}
    done
fi
unset my_zsh_fpath

#-----------------------------------------------------
#
# Load all scripts ${ZSHCONFIG}/lib/*.zsh
#
my_zsh_lib=${ZSHCONFIG}/lib
if [[ -d "$my_zsh_lib" ]]; then
    for file in $my_zsh_lib/*.zsh; do
        source $file
    done
fi
unset my_zsh_lib

eval "$(fnm env --multi)"

iterm2_print_user_vars() {
    iterm2_set_user_var rubyVersion $(ruby -v | awk '{ print $2 }')
    iterm2_set_user_var nodeVersion $(node -v)
}
