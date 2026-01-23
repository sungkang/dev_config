#!/bin/sh

# keyboard layout (optional)
setxkbmap us

# composer (optional)
picom &

# wallpaper (optional)
# feh --bg-scale /path/to/wallpaper.jpg &

# keyboard repeat rate
xset r rate 300 30

exec dwm
