#!/bin/sh

tmp="$(amixer get Master | tail -n1 | awk '{print $5 $6}')"

status="$(echo "$tmp" | grep -o -e '[a-z]*')"
volume="$(echo "$tmp" | grep -o -e '[0-9].*%')"

[ -z "$volume" ] && exit 0

if [ "$status" = 'on' ]; then
	echo "󰕾 $volume"
else
	echo "󰖁 $volume"
fi
