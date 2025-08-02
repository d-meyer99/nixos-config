#!/usr/bin/env bash

swww-daemon &
swww img ~/Wallpaper/wallpaper.jpg &
# you can install this by adding
nm-applet --indicator &

waybar &

# mako
mako
