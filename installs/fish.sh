#!/bin/bash

# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
  echo "MacOs is unsupported"
elif [ $(uname -s) = "Linux" ]; then
  echo "What OS are you using? (ubuntu[unsupported], arch)"
  read os

  if [ $os = "arch" ]; then
    sudo pacman -Sy fish
  elif [$os = "ubuntu" ]; then
    echo "Debian distros unsupported"
  fi
else
    echo "Get a real OS"
fi
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf
