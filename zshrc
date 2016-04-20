autoload -Uz promptinit && promptinit
autoload -Uz colors && colors

source $HOME/dotfiles/shell/aliases.zsh
source $HOME/dotfiles/shell/common.zsh
source $HOME/dotfiles/zsh/git-prompt.zsh

setopt hist_ignore_space

PROMPT="\
%{%(?..${bg[red]}${fg_bold[white]}%}%?%{${reset_color}%} %{)%}\
%{$fg[cyan]%}%n@%m \
%{$fg[yellow]%}%~%{$reset_color%}\
%# "

export PATH=$HOME/bin:/usr/local/bin:$PATH
