#!/bin/sh

cp ~/.config/waybar/random/config.jsonc ~/.config/waybar
cp ~/.config/waybar/random/style.css ~/.config/waybar

pkill -x waybar
waybar & disown