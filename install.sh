#!/bin/bash

[[ $1 != "" ]] && dest=$1 || dest=~
dotfiles_path=$dest/dotfiles
backup_path=$dest/dotfiles_old
symlinks=(
#    target                             link
    "${dotfiles_path}/bashrc            ${dest}/.bashrc"
    "${dotfiles_path}/vim/vimrc         ${dest}/.vimrc"
    "${dotfiles_path}/vim               ${dest}/.vim"
    "${dotfiles_path}/zshrc             ${dest}/.zshrc"
    "${dotfiles_path}/irssi             ${dest}/.irssi"
    "${dotfiles_path}/gitconfig         ${dest}/.gitconfig"
    "${dotfiles_path}/dircolors         ${dest}/.dircolors"
    "${dotfiles_path}/mc                ${dest}/.mc"
    "${dotfiles_path}/tmux.conf         ${dest}/.tmux.conf"
)



# install oh-my-zsh
if [[ -e $dest/.oh-my-zsh ]] || [[ -h $dest/.oh-my-zsh ]]; then
    mv $dest/.oh-my-zsh $backup_path
fi
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# backup existing configs & install new symlinks
count=0
while [ "x${symlinks[count]}" != "x" ]; do
    target=$(echo ${symlinks[count]} | awk '{print $1}')
    link=$(echo ${symlinks[count]} | awk '{print $2}')

    if [[ -e $link ]] || [[ -h $link ]]; then
        mkdir -p $backup_path
        mv $link $backup_path
    fi

    ln -s $target $link

    count=$(( $count + 1 ))
done
