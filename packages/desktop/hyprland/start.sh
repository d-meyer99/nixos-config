#!/usr/bin/env bash

awww-daemon &
awww img ~/Wallpaper/wallpaper.jpg &
# you can install this by adding
nm-applet --indicator &

waybar &

# mako
mako
