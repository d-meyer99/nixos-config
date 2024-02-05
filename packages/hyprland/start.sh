#!/usr/bin/env bash

swww init;
swww img ~/Wallpaper/wallpaper.jpg &
# you can install this by adding
nm-applet --indicator &

# the bar
waybar &

# dunst
dunst
