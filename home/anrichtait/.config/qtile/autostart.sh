#!/bin/bash

picom --config ~/.config/picom/picom.conf &
nitrogen --restore &
#feh --bg-scale ~/Pictures/Wallpapers/fuji.jpg &
unclutter -idle 3 &
setxkbmap -option compose:ralt &
