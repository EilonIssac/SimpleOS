#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '

alias ll='ls -la'
PS1="\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[0;34m\]\w\[\e[m\] $ \[\e[m\]"
neofetch -L
