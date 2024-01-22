#!/bin/sh

sysresources='/etc/X11/xinit/.Xresources'
sysmodmap='/etc/X11/xinit/.Xmodmap'
userresources="$XDOTDIR/.Xresources"
usermodmap="$XDOTDIR/.Xmodmap"

# Merge in resources and modmaps
[ -f "$sysresources" ] && xrdb -merge "$sysresources"
[ -f "$sysmodmap" ] && xmodmap "$sysmodmap"
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# Load drop-in files
if [ -d '/etc/X11/xinit/xinitrc.d' ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Only use the dedicated NVIDIA GPU
xrandr --setprovideroutputsource modesetting NVIDIA-0 --auto

# Get available display outputs and pick the preferred one
if xrandr --current | grep 'DP-0 connected'; then
	output='DP-0'
elif xrandr --current | grep 'HDMI-0 connected'; then
	output='HDMI-0'
else
	output='eDP-1-1'
fi

# Get the EDID of the preferred display
display_edid="$(\
	xrandr --current --prop |\
	sed -n "/$output/,/connected/ p" |\
	grep -A16 'EDID' |\
	grep -o '[a-f|0-9]*$')"

# Load display-specific preferences based on its EDID
case "$display_edid" in
	"$(cat "$XDOTDIR/display-edids/acer-xb270hu.txt")")
		dpi='96'
		resolution='2560x1440'
		refresh_rate='144'
		;;

	"$(cat "$XDOTDIR/display-edids/sharp-lc-60le650u.txt")")
		dpi='96'
		resolution='1920x1080'
		refresh_rate='60'
		;;

	"$(cat "$XDOTDIR/display-edids/vizio-e70-e3.txt")")
		dpi='240'
		resolution='3840x2160'
		refresh_rate='60'
		;;

	"$(cat "$XDOTDIR/display-edids/gigabyte-g5-kc.txt")")
		dpi='96'
		resolution='1920x1080'
		refresh_rate='144'
		;;

	"$(cat "$XDOTDIR/display-edids/lg-27mp400.txt")")
		dpi='96'
		resolution='1920x1080'
		refresh_rate='60'
		;;

	*)	# Fallback preferences
		dpi='96'
		resolution='1920x1080'
		refresh_rate='60'
		;;
esac

# Configure the display
xrandr \
	--dpi "$dpi" \
	--output 'DP-0' --off \
	--output 'HDMI-0' --off \
	--output 'eDP-1-1' --off \
	--output "$output" --primary --mode "$resolution" --rate "$refresh_rate"

# Fix application DPI scaling
echo "Xft.dpi: $dpi" | xrdb -override -

# Export environment variables
dbus-update-activation-environment --systemd --all

# Disable Logitech G203 mouse LEDs
openrgb --profile "$HOME/.config/OpenRGB/disable-mouse-leds.orp" &

# Disable laptop keyboard LEDs
brightnessctl -d 'rgb:kbd_backlight' set 0 &

# Set the initial master volume to 0
volume set 0 &

# Start graphical environment
feh --no-fehbg --bg-fill "$WALLPAPER" &
wal --theme "$PYWAL_THEME" -b "$PYWAL_BG_COLOR" &
picom &
sxhkd &
numlockx &
dwmblocks &
exec "$WM"
