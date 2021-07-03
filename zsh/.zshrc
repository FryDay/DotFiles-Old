# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zshrc

# not running interactively then bail
[[ $- != *i* ]] && return
ZSH=/usr/share/oh-my-zsh

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

export GO111MODULE=on
EDITOR=nvim
VISUAL=~/.config/nnn/ewrap

plugins=(
  git
  sudo
)

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export PATH="$PATH:/home/jordan/.local/bin"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
if [ `tput colors` != "256" ]; then
  ZSH_THEME="robbyrussell"
else
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# export PATH=/home/mh/.pyenv/versions/3.7.2/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export PATH=/home/mh/.ebcli-virtual-env/executables:$PATH

# alias
unalias l
unalias la
unalias ll
unalias ls
unalias lsa

alias ll='exa -l'
alias ls='exa'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias update='paru -Syyu --noconfirm'
alias vim='nvim'
alias sudo='sudo '
