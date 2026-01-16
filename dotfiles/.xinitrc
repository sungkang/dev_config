#!/bin/sh

# keyboard layout (optional)
setxkbmap us

# composer (optional)
picom &

# wallpaper (optional)
# feh --bg-scale /path/to/wallpaper.jpg &

# keyboard repeat rate
xset r rate 200 40

# mouse settings
xinput set-prop "pointer:Logitech G305" \
  "libinput Accel Profile Enabled" 0, 1
xinput set-prop "pointer:Logitech G305" \
  "libinput Natural Scrolling Enabled"  1

exec dwm
