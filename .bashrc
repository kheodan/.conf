#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#shopt -s autocd
stty -ixon
alias go='git checkout'
source ~/.git-completion.bash

alias ops-set='source ~/sf_D_DRIVE/openstack/'
alias ops-unset='for i in `set|grep --color=never ^OS_|sed 's/=.*//'`; do unset $i; done'
alias ops='openstack'

alias pyserver='python -m SimpleHTTPServer'
alias tmx='if [ $(tmux ls|wc -l) > 0 ]; then tmux new -A -s main; else tmux attach;fi'
alias vimp='vimpager'

alias examples='python ~/examples/examples.py'
alias halt='sudo shutdown -P now'
alias reboot='sudo reboot'
alias update='pacman -Syu'
alias ll='ls -lah'
alias ..='cd ..'
alias ~='cd ~'

export PAGER='less'
export EDITOR='vim'
export PATH=~/bin:~/.local/bin:$PATH
reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
white=$(tput setaf 7)
PS1='\[$green\]\h\[$reset\] \[$red\]\t\[$reset\] \[$green\]\$ \[$reset\]\[$white\]'
#----------------------------------------------------------------------------------
cl() {
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; ls -la
    else
        echo "bash: cl: $dir: Directory not found"
    fi
}
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
#------------------------------------
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
#--------------------------------------
alias ls='ls --color=auto'
alias pacman='sudo pacman --color always'
alias grep='grep --color=always'
alias dig='grc dig +noall +answer'
alias ports='grc netstat -auntl'
alias df='grc df'
alias ps='grc ps'
alias lsblk='grc lsblk'
alias ping='grc ping'
