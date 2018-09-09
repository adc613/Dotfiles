#!/bin/bash

# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
  brew install zsh zsh-completions
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif [ $(uname -s) = "Linux" ]; then
  echo "What OS are you using? (ubuntu[unsupported], arch)"
  read os

  if [ $os = "arch" ]; then
    sudo pacman -Sy zsh
    git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh -s /bin/zsh
  elif [$os = "ubuntu" ]; then
    echo "Debian distros unsupported"
  fi
else
    echo "Get a real OS"
fi
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf
