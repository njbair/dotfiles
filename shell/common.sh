if ( command -v uname >/dev/null 2>&1 ); then
    export UNAME="$(uname)"
fi

export MC_SKIN="$HOME/dotfiles/colors/mc-solarized/solarized.ini"

command -v pygmentize >/dev/null 2>&1 &&
    export LESS='-R' &&
    export LESSOPEN='|~/dotfiles/lessfilter %s'

export GOPATH=$HOME/gocode/

eval `dircolors ~/dotfiles/colors/dircolors-solarized/dircolors.ansi-universal`

PATH=/usr/games:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/njbair/bin:/home/njbair/.gem/ruby/1.9.1/bin:/home/njbair/gocode/bin
export PATH

export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm
