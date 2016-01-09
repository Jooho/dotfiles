#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ $overwrite_symlink ]; then
        if [ -h $target ]; then
           echo "~${target#$HOME} is symbolic link so do not need to relink... Skipping."
        else
           echo "Backup ~${target#$HOME} to ~${target#$HOME}.bak "
           mv $target "$target.bak"

           echo "Creating symlink for $file"
           ln -s $file $target
        fi
    elif [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

configs=$( find "$DOTFILES/config" -maxdepth 3 -name '*.config')
for config in $configs; do
    app=$(basename $( dirname $config))
    target=$HOME/.config/$app/$( basename $config  ".config")
    if [ $overwrite_symlink ]; then
        if [ -h $target ]; then
           echo "~${target#$HOME} is symbolic link so do not need to relink... Skipping."
        else
           echo "Backup ~${target#$HOME} to ~${target#$HOME}.bak "
           mv $target "$target.bak"
  
           echo "Creating symlink for $file"
           ln -s $file $target
        fi
    elif [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done

