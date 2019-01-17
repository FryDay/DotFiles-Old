# Zshrc

# not running interactively then bail
[[ $- != *i* ]] && return

ZSH=/usr/share/oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
DISABLE_AUTO_UPDATE="true"

POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir newline vcs)

# shell opts
setopt auto_cd
setopt bang_hist
setopt completealiases
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt inc_append_history
setopt share_history

function gitclean
{
    git fetch -p
    for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`;
    do
            git branch -D $branch
    done
}

# alias
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias ls='ls --color=auto'
alias upd='sudo pacman -Syyu'
alias pac='sudo pacman --color auto'
alias merge='xrdb -merge ~/.Xresources'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias update='yay -Syyu'

export AWS_REGION=us-west-2
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export HAXE_STD_PATH=/usr/lib/haxe/std

plugins=(
  git
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
