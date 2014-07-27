#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

cp /opt/justbrowsing/Xresources $userresources

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# start justbrowsing session
mkdir -p /dev/shm/Downloads

[ -f "/tmp/firefox.lock" ] ||
[ -f "/tmp/google-chrome.lock" ] ||
setjb-default

setjb-gpu vbox-daemon
setjb-display
setjb-zone
setjb-locale
setjb-backlight
setjb-idle
setjb-mouse
setjb-volume
loadjb-panel

exec i3
