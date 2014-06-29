#!/bin/sh

#if [ -z $DBUS_SESSION_BUS_ADDRESS ]; then
#  eval `dbus-launch --sh-syntax --exit-with-session`;
#  echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS" | tee -a /dev/shm/dbus.log;
#fi

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# start some nice programs


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

_modeline=$(cat /proc/cmdline 2>/dev/null | grep -o "\w*gpu=\w*" | tail -n 1 | awk -F "=" '{print $2}');
if [ "$_modeline" = "vbox" ]; then
    VBoxClient-all &
fi

/opt/justbrowsing/start
/opt/justbrowsing/setlocale
/opt/justbrowsing/autosize
exec i3
