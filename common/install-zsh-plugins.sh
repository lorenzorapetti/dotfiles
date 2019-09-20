#!/bin/bash

ZSH_PLUGINS=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins

git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_PLUGINS/you-should-use
git clone https://github.com/lukechilds/zsh-better-npm-completion.git $ZSH_PLUGINS/zsh-better-npm-completion
git clone https://github.com/pkulev/zsh-rustup-completion.git $ZSH_PLUGINS/rustup
git clone https://github.com/g-plane/zsh-yarn-autocompletions.git $ZSH_PLUGINS/yarn-autocompletions
git clone https://github.com/Cloudstek/zsh-plugin-appup.git $ZSH_PLUGINS/appup
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS/zsh-autosuggestions
