#/bin/bash

# Install nvim if flagged is specified.
if [ "$1" = "--nvim" ]; then
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
        apt-get install neovim
        apt-get install python-neovim
        apt-get install python3-neovim
      fi
    else
        echo "Neovim installation is currently only supported on macOS"
        echo "To install Neovim manually on other operating systems, refer to github.com/neovim/neovim/wiki/Installing-Neovim"
        echo "After installing, run the following: mkdir ~/.config; ln -s ~/.vim ~/.config/nvim; ln -s ~/.vimrc ~/.config/nvim/init.vim"
    fi
elif [ "$1" = "--ideavim" ]; then
    ln -sf $SETUP_DIR/ideavimrc ~/.ideavimrc
    echo "ideavimrc has been linked as ~/.ideavimrc and installed plugins."
fi
