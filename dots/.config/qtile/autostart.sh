#!/bin/bash

#picom --config ~/.config/picom/picom.conf &
feh --bg-scale --output eDP-1 ~/Pictures/Wallpapers/sky.jpg --output HDMI-2 ~/Pictures/Wallpapers/sky.jpg &
unclutter -idle 3 &
setxkbmap -option compose:ralt &
sudo systemctl stop mpd.socket &
sudo systemctl stop mpd &
mpd &
