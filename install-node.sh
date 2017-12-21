#/bin/bash

# macOS-specific installations.
if [ $(uname -s) = 'Darwin' ]; then
  echo "mac OS unsupported"
elif [ $(uname -s) = "Linux" ]; then
  if [ $(which apt-get) != "" ]; then
    sudo apt-get install -y build-essential
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
    sudo apt-get install -y nodejs
  fi
else
    echo "Get a real OS"
fi
