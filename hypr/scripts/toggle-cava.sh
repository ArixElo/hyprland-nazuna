#!/bin/bash

# Check if cava scratchpad is already running
if hyprctl clients | grep -q "class: cava-scratchpad"; then
    # If running, kill it
    hyprctl dispatch closewindow "class:cava-scratchpad"
else
    # If not running, launch it
    kitty --class cava-scratchpad -e cava &
fi
