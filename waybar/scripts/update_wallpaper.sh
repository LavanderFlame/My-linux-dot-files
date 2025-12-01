#!/bin/bash

# Full paths to avoid PATH issues
WAL="/usr/bin/wal"
WAYBAR="/usr/bin/waybar"
PKILL="/usr/bin/pkill"
NOTIFY="/usr/bin/notify-send"
SWWW="/usr/bin/swww"

primary_monitor="HDMI-A-1"

# Wait a tiny bit for Waypaper to apply wallpaper
sleep 0.5

# Get current wallpaper
wallpaper=$($SWWW query | grep "^: $primary_monitor:" | sed 's/.*image: //')
[ -z "$wallpaper" ] && exit 1

# Generate pywal colors (wait until done)
$WAL -q -n -i "$wallpaper"

# Small pause to ensure colors are written
sleep 0.2

# Reload Waybar
$PKILL -x waybar
$WAYBAR &

# Notify
wallname=$(basename "$wallpaper")
$NOTIFY "Wallpaper Applied" "Colors updated from $wallname"

