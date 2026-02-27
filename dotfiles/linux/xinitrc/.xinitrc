#!/bin/sh

# keyboard layout (optional)
setxkbmap us

# composer (optional)
picom &

# wallpaper (optional)
# feh --bg-scale /path/to/wallpaper.jpg &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsettingsd &

export PATH="$HOME/.local/bin:$PATH"

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval $(dbus-launch --sh-syntax)
fi

# TODO: launches the auth agent (keep forgetting what this is for, checking later)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# configure current dual monitor layout (xrandr)
$HOME/.screenlayout/dual-monitor-setup.sh &

# ssh askpass
export SSH_ASKPASS="$HOME/.local/bin/dmenu-askpass"
export SSH_ASKPASS=prefer

# xdg stuff
# 1. Identify the desktop session for portals
export XDG_CURRENT_DESKTOP=X-Generic

# 2. Force D-Bus to update its environment variables
dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP

# 3. Start/Restart the portal services manually to be sure
/usr/lib/xdg-desktop-portal &
/usr/lib/xdg-desktop-portal-gtk &

# thunar file manager
thunar --daemon &

$HOME/.local/bin/startdwm.sh
