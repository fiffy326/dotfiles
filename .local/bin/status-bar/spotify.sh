#!/bin/sh

if [ "$(playerctl -p 'spotify,spotifyd' status)" = 'Playing' ]; then
	artist="$(playerctl -p 'spotify,spotifyd' metadata artist)"
	title="$(playerctl -p 'spotify,spotifyd' metadata title | sed -E 's/\s*-.*$//g')"
	echo "󰓇 $artist - $title"
fi

# vim:set ts=4 sts=4 sw=4:
