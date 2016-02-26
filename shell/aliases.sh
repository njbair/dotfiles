if ( command -v uname >/dev/null 2>&1 ); then
    UNAME="$(uname)"
fi
if [ "$UNAME" = "Darwin" ]; then
    LS_OPTS="-G"
    export LS_OPTS
elif [ "$UNAME" = "Linux" ]; then
    LS_OPTS="--color=auto --group-directories-first"
    export LS_OPTS
else
    export LS_OPTS=""
fi

# file listings should be colored, classified, grouped, & human-readable
alias ls="ls -Fh $LS_OPTS"
alias ll="ls -l"
alias lla="ls -la"
alias la="ls -lA"
alias l="ls -CF"

# disable word-wrapping in less
alias less='less -S'

# "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# shorthand process search
alias psx="ps aux | grep $1"

# todo.txt aliases
alias todo='todo.sh'
alias t='todo.sh'

# run grep through a less pipe with full color
grepless () { grep --color=always "$@" | less; }
