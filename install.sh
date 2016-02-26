#!/bin/bash

[[ $1 != "" ]] && dest=$1 || dest=~
dotfiles_path=$dest/dotfiles
backup_path=$dest/dotfiles_old
#files="bashrc bash vimrc vim zshrc oh-my-zsh irssi gitconfig dircolors mc tmux.conf"
symlinks=(
#    target                         link
    "${dotfiles_path}/bashrc        ${dest}/.bashrc"
    "${dotfiles_path}/bash          ${dest}/.bash"
    "${dotfiles_path}/vim/vimrc     ${dest}/.vimrc"
    "${dotfiles_path}/vim           ${dest}/.vim"
    "${dotfiles_path}/zshrc         ${dest}/.zshrc"
    "${dotfiles_path}/irssi         ${dest}/.irssi"
    "${dotfiles_path}/gitconfig     ${dest}/.gitconfig"
    "${dotfiles_path}/dircolors     ${dest}/.dircolors"
    "${dotfiles_path}/mc            ${dest}/.mc"
    "${dotfiles_path}/tmux.conf     ${dest}/.tmux.conf"
)



count=0
while [ "x${symlinks[count]}" != "x" ]; do
    target=$(echo ${symlinks[count]} | awk '{print $1}')
    link=$(echo ${symlinks[count]} | awk '{print $2}')

    #echo "${link} -> ${target}"

    if [[ -e $link ]] || [[ -h $link ]]; then
        mkdir -p $backup_path
        mv $link $backup_path
    fi

    ln -s $target $link

    count=$(( $count + 1 ))
done

#for file in $files; do
#	if [[ -e $target/.$file ]] || [[ -h $target/.$file ]]; then
#		mkdir -p $backup_path
#		mv $target/.$file $backup_path/$file
#	fi
#done
#echo "Done!"
#
#echo -n "Creating symlinks..."
#for file in $files; do
#	ln -s $dotfiles_path/$file $target/.$file
#done
#echo "Done!"
