#!/bin/bash

## Based on a default ~/.bashrc
## which is a copy of /etc/skel/.bashrc

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## coreutils with colorized output
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='dir --color=auto'
alias dmesg='dmesg --color'
alias diff='colordiff'
alias tree='tree -C'

## less with syntax highlight
# export LESSOPEN="| source-highlight-esc.sh %s"
export LESSOPEN="| lesspipe.sh %s"
export LESS=' -R '

## less with GNU Global tags
export LESSGLOBALTAGS=global

## feh with tiling WM support
alias feh='feh --geometry 500x500 --scale-down'

## nano as default editor
export EDITOR="nano"

## bash prompt with colorization
# PS1='[\u@\h \W]\$ '
PS1="\342\224\214[\[\e[1;32m\]\u\[\e[0;32m\]@\[\e[1;32m\]\h\[\e[0m\] \[\e[1;34m\]\W\[\e[0m\]]\n\342\224\224\342\224\200\[\e[1;32m\]\$\[\e[0m\] "
