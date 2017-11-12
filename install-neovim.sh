#/bin/bash

# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
    # Install neovim and python support dependencies.
    brew install neovim
    pip2 install --user neovim
    pip3 install --user neovim

    # Link vim configuration to neovim.
    mkdir -p ~/.config/nvim/autoload
    ln -sf $SETUP_DIR/vimrc ~/.config/nvim/init.vim
    ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/
elif [ $(uname -s) = "Linux" ]; then
  if [ $(which apt-get) != "" ]; then
    apt-get install software-properties-common
    add-apt-repository ppa:neovim-ppa/stable
    apt-get update
    apt-get install neovim
    apt-get install python-dev python-pip python3-dev python3-pip
    pip2 install --upgrade neovim
    pip3 install --upgrade neovim
    apt-get install ruby
    apt-get install ruby-all-dev
    gem install neovim
  fi
else
    echo "Neovim installation is currently only supported on macOS"
    echo "To install Neovim manually on other operating systems, refer to github.com/neovim/neovim/wiki/Installing-Neovim"
    echo "After installing, run the following: mkdir ~/.config; ln -s ~/.vim ~/.config/nvim; ln -s ~/.vimrc ~/.config/nvim/init.vim"
fi

ln -sf ~/Dotfiles/init.vim ~/.config/nvim/init.vim
