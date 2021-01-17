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

# alias
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias ls='ls --color=auto'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias update='yay -Syyu --noconfirm'
alias vim='nvim'
alias sudo='sudo '

export GO111MODULE=on
EDITOR=nvim
VISUAL=~/.config/nnn/ewrap

plugins=(
  git
  sudo
)

export GPG_TTY=/dev/pts/1
gpg-connect-agent updatestartuptty /bye > /dev/null
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=/run/user/1001/gnupg/S.gpg-agent.ssh

# Created by `userpath` on 2020-10-11 05:24:05
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
