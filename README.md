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
workspace_layout stacking
bindsym $mod+l exec withlock $HOME/.locks/nagbar.lock /opt/justbrowsing/lockswitch
bindsym XF86AudioMute exec mute_toggle
bindsym XF86AudioLowerVolume exec vol_down
bindsym XF86AudioRaiseVolume exec vol_up
exec withlock $HOME/.locks/panel.lock adeskbar
exec withlock $HOME/.locks/audio.lock pnmixer
exec withlock $HOME/.locks/networking.lock nm-applet
exec withlock $HOME/.locks/reload.lock /opt/justbrowsing/browser
for_window [title="main.py"] floating enable
new_window 1pixel
```

-------------------------

* ~/.wbar

```sh
i: /usr/share/pixmaps/wbar/dock.png
c: wbar --bpress --above-desk --pos top-left --noreload --isize 32 --idist 5 --nanim 3 --zoomf 1.800000 --jumpf 1.000000
t: /opt/justbrowsing/DSDIGI/20

i: /usr/share/icons/custom/shutdown48.png
c: /sbin/poweroff
t: Shutdown

i: /usr/share/icons/custom/reboot48.png
c: /sbin/reboot
t: Reboot
```

-------------------------

* ~/.config/nitrogen/bg-saved.cfg

```sh
[:0.0]
file=/home/user/.i3/wallpaper.png
mode=4
bgcolor=#000000
```

* ~/.config/nitrogen/nitrogen.cfg

```sh
[geometry]
posx=0
posy=36
sizex=1278
sizey=883

[nitrogen]
view=icon
icon_caps=false
dirs=/home/user/.i3;
```
