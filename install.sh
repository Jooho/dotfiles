#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Updating OSX settings"
    source installosx.sh

#    echo "Installing node (from nvm)"
#    source install/nvm.sh


elif [ "$(uname)" == "Linux" ]; then
    if [ "$(uname -a|grep fc)" ]; then
	echo "Running on Fedora"

        echo "dnf install all the things"
        source install/fedora.sh

       # echo "Updating Fedora settings"
       # source install_fedora.sh
      
        echo "Installing node (from nvm)"
        source install/nvm_fedora.sh
      
    fi

fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp
cp -R vim/vim.symlink/* ~/.vim/


echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."

