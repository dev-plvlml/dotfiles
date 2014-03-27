## Based on a default ~/.bash_profile
## which is a copy of /etc/skel/.bash_profile

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

## gcc with ccache enabled
PATH=/usr/lib/ccache/bin/:$PATH

## m4e5tr0's scripts folder
PATH=$PATH:~/1-linux/scripts/

## others' scripts folder
PATH=$PATH:~/0-linux/scripts/
