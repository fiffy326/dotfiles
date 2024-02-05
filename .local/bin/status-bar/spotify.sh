#!/bin/sh

max_length=45

strlen() {
	printf '%s' "$1" | wc -c
}

if [ "$(playerctl -p 'spotify,spotifyd' status)" = 'Playing' ]; then
	artist="$(playerctl -p 'spotify,spotifyd' metadata artist)"
	title="$(playerctl -p 'spotify,spotifyd' metadata title | sed -E 's/\s*-.*$//g')"
	status="󰓇 $artist - $title"
	if [ "$(strlen "$status")" -le "$max_length" ]; then
		printf '%s' "$status"
	else
		total_words=$(printf '%s' "$status" | wc -w)
		while [ "$(strlen "$status")" -gt $((max_length)) ]; do
			status="$(printf '%s' "$status" | cut -d ' ' -f -"$total_words")"
			total_words=$((total_words - 1))
		done
		printf '%s%s' "$status" "…"
	fi
fi
