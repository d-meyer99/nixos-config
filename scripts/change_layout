#!/usr/bin/env bash

swaymsg input type:keyboard xkb_switch_layout next

layout=$(swaymsg -t get_inputs | jq '.[1].xkb_active_layout_name')

notify-send "Kayboard Layout" "Changed Layout to: $layout"
