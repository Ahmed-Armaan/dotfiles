#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias slp='/usr/local/bin/sleep.sh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Go Paths
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:~/.local/bin/

export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/init-nvm.sh

#PS1='[\u@\h \W]\$ '
PS1='[\[\e[0m\] \[\e[0;31m\]\W\[\e[0m\]] '
