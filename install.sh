#!/bin/bash

dotfiles_path=~/dotfiles
backup_path=~/dotfiles_old
files="bashrc bash_extra vimrc vim zshrc oh-my-zsh"

echo -n "Creating backup directory..."
mkdir -p $backup_path
echo "Done!"

echo -n "Backing up old dotfiles..."
for file in $files; do
	mv ~/.$file $backup_path
done
echo "Done!"

echo -n "Creating symlinks..."
for file in $files; do
	ln -s $dotfiles_path/$file ~/.$file
done
echo "Done!"
