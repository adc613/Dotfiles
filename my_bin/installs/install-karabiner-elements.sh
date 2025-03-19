#!/bin/bash

cd ~
mkdir -p tmp
cd tmp
brew install boost
git clone --depth 1 https://github.com/tekezo/Karabiner-Elements.git
cd Karabiner-Elements
sudo xcode-select --switch /Library/Developer/CommandLineTools
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
make
