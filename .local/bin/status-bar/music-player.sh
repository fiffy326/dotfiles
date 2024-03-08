#!/bin/sh

max_length=45

spotify_icon='󰓇'
mpv_icon=''

strlen() {
	printf '%s' "$1" | wc -c
}

if [ "$(playerctl -p 'spotify,spotifyd' status)" = 'Playing' ]; then
	player='spotify,spotifyd'
	icon="$spotify_icon"
elif [ "$(playerctl -p 'mpv' status)" = 'Playing' ]; then
	player='mpv'
	icon="$mpv_icon"
else
	exit 0
fi

artist="$(playerctl -p "$player" metadata artist |\
	sed -E 's/\s*(\(|-).*//g')" # Remove featured artists/remix/etc.

if [ -z "$artist" ]; then
	exit 0
fi

title="$(playerctl -p "$player" metadata title |\
	sed -E 's/\s*(\(|-).*//g')" # Remove featured artists/remix/etc.

status_bar="$icon $artist - $title"

# Trim to $max_length (at nearest word boundary)
if [ "$(strlen "$status_bar")" -le $max_length ]; then
	printf '%s' "$status_bar"
else
	total_words=$(printf '%s' "$status_bar" | wc -w)
	while [ "$(strlen "$status_bar")" -gt $max_length ]; do
		status_bar="$(printf '%s' "$status_bar" | cut -d ' ' -f -"$total_words")"
		total_words=$((total_words - 1))
	done
	printf '%s%s' "$status_bar" '…'
fi
