# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
  brew install tmux
elif [ $(uname -s) = "Linux" ]; then
  if [ $(which apt-get) != "" ]; then
    echo "Debian distros unsupported"
  fi
else
    echo "Get a real OS"
fi
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf
