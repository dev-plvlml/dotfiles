#!/bin/sh

## Based on a copy of /etc/skel/.xinitrc

#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
	[ -x "$f" ] && . "$f"
    done
    unset f
fi

## Xmodmap key bindings
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

## Extra X11 fonts
xset +fp /usr/share/fonts/local/
xset fp rehash

## Misc program settings
if [ -s ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

## Terminal theme
if [ -s ~/1-linux/themes/zenburn-by-m4e5tr0.Xresources ]; then
    xrdb -merge ~/1-linux/themes/zenburn-by-m4e5tr0.Xresources
fi

## Udiskie autostart
udiskie -s &

## Xneur autostart
# xneur > /dev/null &

## Rxvt-unicode daemon
urxvtd -q -f -o

## Emacs daemon
emacs --daemon
EDITOR=emacsclient

## Composite manager
unagi &

exec $1
