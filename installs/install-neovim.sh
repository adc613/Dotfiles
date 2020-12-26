#/bin/bash


# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
    # Install neovim and python support dependencies.
    brew install neovim
    brew install python
    brew install python3
    pip2 install --user neovim
    pip3 install --user neovim
    sudo gem install neovim

    # Link vim configuration to neovim.
    mkdir -p ~/.config/nvim/autoload
    ln -sf $SETUP_DIR/vimrc ~/.config/nvim/init.vim
    ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/
elif [ $(uname -s) = "Linux" ]; then
  echo "What OS are you using? (ubuntu, arch)"
  read os

  if [ $os = "ubuntu" ]; then
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
  elif [ $os = "arch" ]; then
    echo "Hello Arch \n"
    sudo pacman -Sy neovim
    sudo pacman -Sy python2-neovim python-neovim ruby nodejs npm
    gem install neovim
    sudo npm install -g neovim
  fi
else
    echo "Get a real OS"
fi

mkdir -p ~/.config/nvim/
ln -sf ~/Dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/Dotfiles/config/ ~/.config/nvim/config
ln -sf ~/Dotfiles/UltiSnips/ ~/.config/nvim/UltiSnips
ln -sf ~/Dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -

# Install node for plugins
sudo apt-get update && sudo apt-get install -y nodejs yarn
sudo npm install -g neovim

# Install python plugins stuff
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip install neovim
python2 get-pip.py
sudo apt install -y python2

# Ruby plugins stuf
sudo gem install neovim
