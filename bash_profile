#!/bin/bash

## Based on a default ~/.bash_profile
## which is a copy of /etc/skel/.bash_profile

#
# ~/.bash_profile
#

## Use gcc with ccache enabled and no colorgcc
# PATH=/usr/lib/ccache/bin/:$PATH

## Use gcc with ccache and colorgcc enabled
# PATH=/usr/lib/colorgcc/bin/:$PATH # NOTE: /etc/profile
export CCACHE_PATH=/usr/bin/ # NOTE: ~/.colorgccrc

## m4e5tr0's scripts folder
PATH=$PATH:~/1-linux/scripts/

## others' scripts folder
PATH=$PATH:~/0-linux/scripts/

[[ -f ~/.bashrc ]] && . ~/.bashrc
