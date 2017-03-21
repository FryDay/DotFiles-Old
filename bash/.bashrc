#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export GOPATH=~/go
PATH="$(ruby -e 'print Gem.user_dir')/bin:$GOPATH/bin:$PATH"
source /usr/bin/virtualenvwrapper.sh

alias ls='ls --color=auto'
#alias update='pacaur -Syu'
alias update='yaourt -Syua'
alias spotify="/usr/bin/spotify --force-device-scale-factor=1.5"
PS1='[\u@\h \W]\$ '
