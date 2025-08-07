#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias slp='/usr/local/bin/sleep.sh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

#PS1='[\u@\h \W]\$ '
PS1='[\[\e[0m\] \[\e[0;31m\]\W\[\e[0m\]] '
