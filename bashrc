#!/bin/bash

## Based on a default ~/.bashrc
## which is a copy of /etc/skel/.bashrc

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Use coreutils with colorized output
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='dir --color=auto'
alias dmesg='dmesg --color'
alias diff='colordiff'
alias tree='tree -C'

## Use less with source-highlight...
# export LESSOPEN="| source-highlight-esc.sh %s"

## ...or use less with lesspipe
# export LESSOPEN="| lesspipe.sh %s" # NOTE: /etc/profiles.d/lesspipe.sh
export LESS=' -R '

## Use less with GNU Global tags
export LESSGLOBALTAGS=global

## Use feh with tiling WM support
alias feh='feh --geometry 1024x600 --scale-down'

## Use nano as default editor
export EDITOR="nano"
