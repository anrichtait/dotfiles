#!/bin/bash

STATE_FILE="$HOME/.config/qtile/scripts/.focus_mode_state"

if [ ! -f "$STATE_FILE" ]; then
    echo "off" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" == "off" ]; then
	qtile cmd-obj -o cmd -f set_gap --args 0
    pkill picom
    echo "on" > "$STATE_FILE"
else
	qtile cmd-obj -o cmd -f set_gap --args 10
    picom --config ~/.config/picom/picom.conf &
    echo "off" > "$STATE_FILE"
fi
