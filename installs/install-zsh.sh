# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
  brew install zsh zsh-completions
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif [ $(uname -s) = "Linux" ]; then
  if [ $(which apt-get) != "" ]; then
    echo "Debian distros unsupported"
  fi
else
    echo "Get a real OS"
fi
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf
