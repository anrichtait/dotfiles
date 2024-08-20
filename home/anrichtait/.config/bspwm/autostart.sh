#!/usr/bin/env sh

# Run the screen layout script
~/.screenlayout/extscr.sh &

~/.config/polybar/launch.sh &
run sxhkd -c ~/.config/sxhkd/sxhkdrc &
dex --autostart --environment bspwm &
wal -theme &
nm-applet &
picom -b --config ~/.config/bspwm/picom.conf &
blueberry-tray &

sleep 2
nitrogen --restore &
