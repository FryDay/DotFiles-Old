#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
source /usr/bin/virtualenvwrapper.sh

alias ls='ls --color=auto'
alias update='pacaur -Syu'
PS1='[\u@\h \W]\$ '
