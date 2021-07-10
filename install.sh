#!/bin/sh
CONFIG_DIR="$HOME/.config"

echo -e "Creating symlinks...."

# Delete existing dot files and folders
sudo rm -rf $HOME/.gitconfig
sudo rm -rf $HOME/.zshrc

# Create symlinks in the home folder
ln -sf $CONFIG_DIR/.gitconfig $HOME/.gitconfig
ln -sf $CONFIG_DIR/.zshrc $HOME/.zshrc

echo -e "Finished creating"
