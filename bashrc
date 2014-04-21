#!/bin/bash

## Based on a default ~/.bashrc
## which is a copy of /etc/skel/.bashrc

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Use feh with tiling WM support
alias feh='feh --geometry 1024x600 --scale-down'

## Use emacs in client mode as the default editor
## or use nano if emacs daemon is not running
export EDITOR="emacsclient -t -a nano"
