#!/bin/bash

dotfiles_path=~/dotfiles
backup_path=~/dotfiles_old
files="bashrc bash_extra vimrc vim zshrc oh-my-zsh"

echo -n "Backing up old dotfiles..."
for file in $files; do
	if [[ -e ~/.$file ]] || [[ -h ~/.$file ]]; then
		mkdir -p $backup_path
		mv ~/.$file $backup_path/$file
	fi
done
echo "Done!"

echo -n "Creating symlinks..."
for file in $files; do
	ln -s $dotfiles_path/$file ~/.$file
done
echo "Done!"
