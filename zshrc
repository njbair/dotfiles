autoload -Uz promptinit && promptinit
autoload -Uz colors && colors

source $HOME/dotfiles/shell/aliases.sh
source $HOME/dotfiles/shell/common.sh

setopt hist_ignore_space

PROMPT="\
    %{%(?..${fg_bold[red]}%}ret:%?%{${reset_color}%} %{)%}\
    %{$fg[cyan]%}%n@%m \
    %{$fg[yellow]%}%~%{$reset_color%}\
    $(git_prompt_info)%{$reset_color%} \
    %# "

export PATH=$HOME/bin:/usr/local/bin:$PATH
