#!/bin/bash

link_file() {
  local src=$1 dest=$2
  if [[ $dest -ef $src ]]; then
    return # already correctly linked
  fi
  if [[ -e $dest || -L $dest ]]; then
    mv -vi "$dest" "$dest.bak" # back up existing file/symlink
  fi
  mkdir -p "$(dirname "$dest")"
  ln -svfr "$src" "$dest" # relative symlink, forced
}

link() {
  local src=$HOME/dotfiles/$1
  local target=${2-$HOME/$1}
  if [[ -d $src ]]; then
    while IFS= read -r -d '' file; do
      link_file "$file" "$target/${file#"$src"/}"
    done < <(find "$src" -type f -print0)
  else
    link_file "$src" "$target"
  fi
}

link common
link linux
