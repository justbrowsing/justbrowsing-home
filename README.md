justbrowsing-config-files
-------------------------

Various config files for JustBrowsing:

------------------------
* ~/.i3/config

```sh
set $mod Mod4
exec --no-startup-id withlock $HOME/.locks/wallpaper.lock nitrogen --restore
font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
bindsym Control+q kill
bindsym Mod1+F4 kill
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+s layout stacking
bindsym $mod+Shift+w layout tabbed
bindsym $mod+Shift+e layout toggle split
bindsym Control+$mod+Mod1+Delete exec i3-msg exit
workspace_layout tabbed
bindsym $mod+l exec withlock $HOME/.locks/zenity.lock /opt/justbrowsing/lockswitch
bindsym XF86AudioMute exec pulseaudio-ctl mute
bindsym XF86AudioLowerVolume exec pulseaudio-ctl down
bindsym XF86AudioRaiseVolume exec pulseaudio-ctl up
#exec numlockx
exec amixer set Master 100%
exec withlock $HOME/.locks/reload.lock x-www-browser --loop i3
for_window [title="adeskbar.py"] floating enable
for_window [title="JustBrowsing Config"] floating enable
for_window [title="JustBrowsing Config"] border normal
for_window [title="Lock screen"] floating enable
for_window [title="Lock screen"] border normal
new_window 1pixel
bindsym Mod1+F1 exec loadjb-toggle
bindsym Mod1+F2 exec withlock $HOME/.locks/settings.lock jb-config
bindsym Mod1+F3 exec /opt/justbrowsing/debug
bindsym Mod1+F5 exec launch-webapp notes
bindsym Mod1+F6 exec launch-webapp calc
bindsym Mod1+F7 exec launch-webapp timers
bindsym Mod1+F8 exec launch-webapp email
bindsym Mod1+F9 exec launch-webapp wageclock
```

-------------------------

* ~/.wbar

```sh
i: /usr/share/pixmaps/wbar/dock.png
c: wbar --bpress --above-desk --pos top-left --noreload --isize 32 --idist 5 --nanim 3 --zoomf 1.800000 --jumpf 1.000000
t: /opt/justbrowsing/DSDIGI/20

i: /usr/share/icons/justbrowsing/48x48/shutdown.png
c: systemctl poweroff
t: Shutdown

i: /usr/share/icons/justbrowsing/48x48/reboot.png
c: systemctl reboot
t: Reboot
```

-------------------------

* ~/.xinitrc
```sh
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
mkdir -p $HOME/Documents
mkdir -p $HOME/Downloads

[ -f "/tmp/firefox.lock" ] ||
[ -f "/tmp/google-chrome.lock" ] ||
setjb-default

setjb-gpu vbox-daemon
setjb-display
setjb-zone
setjb-locale
loadjb-panel

exec i3
```

-------------------------

* ~/.config/nitrogen/bg-saved.cfg

```sh
[:0.0]
file=/home/user/.i3/wallpaper.png
mode=2
bgcolor=#000000
```

* ~/.config/nitrogen/nitrogen.cfg

```sh
[geometry]
posx=0
posy=54
sizex=1022
sizey=681

[nitrogen]
view=icon
icon_caps=false
dirs=/home/user/.i3;
```
