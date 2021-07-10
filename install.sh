#!/bin/sh
CONFIG_DIR="$HOME/.config"

echo -e "Creating symlinks...."

# Delete existing dot files and folders
sudo rm -rf $HOME/.gitconfig
sudo rm -rf $HOME/.zshrc
sudo rm -rf $HOME/.tmux.conf

# Create symlinks in the home folder
ln -sf $CONFIG_DIR/.gitconfig $HOME/.gitconfig
ln -sf $CONFIG_DIR/.zshrc $HOME/.zshrc
ln -sf $CONFIG_DIR/.tmux.conf $HOME/.tmux.conf

echo -e "Finished creating"
