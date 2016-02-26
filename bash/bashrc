#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
		esac

if [ -e "/etc/lsb-release" ]; then
    export DISTRO=$(cat "/etc/lsb-release" | grep "DISTRIB_ID" | head -1 | awk -F = '{ print $2 }' | awk '{ print $1 }' | tr '[:upper:]' '[:lower:]')
else
	export DISTRO="generic"
fi

if ( command -v uname >/dev/null 2>&1 ); then
    export UNAME="$(uname)"
fi

export PATH=$PATH:${HOME}/bin:${HOME}/.gem/ruby/1.9.1/bin:${HOME}/.composer/vendor/bin
export EDITOR='vim'

# needed by the vim GPG plugin
export GPG_TTY=`tty`

export MC_SKIN="$HOME/.mc/solarized.ini"

command -v pygmentize >/dev/null 2>&1 &&
    export LESS='-R' &&
    export LESSOPEN='|~/dotfiles/lessfilter %s'

# source user-defined settings
declare -a source_files=(
	"$HOME/.bash/bash_aliases"
	"$HOME/.bash/bash_prompt"
	"$HOME/dotfiles/aliases.sh"
);
for source_file in ${source_files[@]}; do
	if [ -e "$source_file" ]; then
		source "$source_file"
	fi
done

if [ -e "~/.nvm" ]; then
    export NVM_DIR="~/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# mac homebrew related stuff
if ( command -v brew >/dev/null 2>&1 ); then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
        GIT_PROMPT_THEME=Solarized
        source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
    fi
fi
