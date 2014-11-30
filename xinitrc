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
if [ -s ~/1-linux/themes/zenburn-care.Xresources ]; then
    xrdb -merge ~/1-linux/themes/zenburn-care.Xresources
fi

## Udiskie autostart
udiskie -s &

## Xneur autostart
# xneur > /dev/null &

## Rxvt-unicode daemon
urxvtd -q -f -o

## Emacs daemon
emacs --daemon
emacsclient -e "(my-daemon-workaround)"

## Composite manager
unagi &

## Window manager
## Based on https://wiki.archlinux.org/index.php/xinitrc#Making_a_DE.2FWM_choice
session=${1:-awesome}
case $session in
    awesome           ) exec awesome;;
    bspwm             ) exec bspwm;;
    catwm             ) exec catwm;;
    cinnamon          ) exec cinnamon-session;;
    dwm               ) exec dwm;;
    enlightenment     ) exec enlightenment_start;;
    ede               ) exec startede;;
    fluxbox           ) exec startfluxbox;;
    gnome             ) exec gnome-session;;
    gnome-classic     ) exec gnome-session --session=gnome-classic;;
    i3|i3wm           ) exec i3;;
    icewm             ) exec icewm-session;;
    jwm               ) exec jwm;;
    kde               ) exec startkde;;
    mate              ) exec mate-session;;
    monster|monsterwm ) exec monsterwm;;
    notion            ) exec notion;;
    openbox           ) exec openbox-session;;
    unity             ) exec unity;;
    xfce|xfce4        ) exec startxfce4;;
    xmonad            ) exec xmonad;;
    *) exec $1;;
esac
