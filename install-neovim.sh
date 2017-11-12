#/bin/bash

mkdir -p ~/config/nvim/
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
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    pip2 install --upgrade neovim
    pip3 install --upgrade neovim
    sudo apt-get install ruby
    sudo apt-get install ruby-all-dev
    sudo gem install neovim
  fi
else
    echo "Get a real OS"
fi

ln -sf ~/Dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/Dotfiles/config/ ~/.config/nvim/config
ln -sf ~/Dotfiles/UltiSnips/ ~/.config/nvim/UltiSnips
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
