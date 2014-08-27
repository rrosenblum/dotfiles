#!/usr/bin/env sh

dir=~/dotfiles
#dotfiles="foo"
dotfiles="aliases bash_profile bashrc gitconfig tmux.conf vim vimrc"

for file in $dotfiles; do
  echo $file
  if (([ -f ~/.$file ] || [ -d ~/.$file ]) && [ ! -f ~/.$file.bak ] && [ ! -d ~/.$file.bak ]); then
    echo "Creating backup of $file"
    mv ~/.$file ~/.$file.bak
  fi

  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
