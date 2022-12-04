# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
  brew install tmux
elif [ $(uname -s) = "Linux" ]; then
  echo "What OS are you using? (ubuntu, arch)"
  read os

  if [ $os = "ubuntu" ]; then
    sudo apt install tmux
  elif [ $os = "arch" ]; then
    sudo pacman -Sy tmux
  fi
else
    echo "Get a real OS"
fi
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf
