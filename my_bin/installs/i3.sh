#/bin/bash


# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
    echo "MacOs is unsupported"
elif [ $(uname -s) = "Linux" ]; then
  echo "What OS are you using? (ubuntu, arch)"
  read os

  if [ $os = "ubuntu" ]; then
    sudo apt install i3
    sudo apt install polybar
    sudo apt install xautolocker
    sudo apt install xcape
  elif [ $os = "arch" ]; then
    echo "Arch is currently unsupport"
  fi
else
    echo "Get a real OS"
fi

mkdir -p ~/.config/i3/
mkdir -p ~/.config/polybar/
ln -sf ~/Dotfiles/.i3.config ~/.config/i3/config
ln -sf ~/Dotfiles/polybar_config ~/.config/polybar/config.ini
