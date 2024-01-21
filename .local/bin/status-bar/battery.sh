#!/bin/sh

plugged_in="$(expr "$(cat '/sys/class/power_supply/AC/online')" + 0)"

[ "$plugged_in" -eq 1 ] && exit

capacity="$(expr "$(cat '/sys/class/power_supply/BAT0/capacity')" + 0)"

if [ "$capacity" -ge 95 ]; then
	status=''
elif [ "$capacity" -ge 75 ]; then
	status=''
elif [ "$capacity" -ge 50 ]; then
	status=''
elif [ "$capacity" -ge 25 ]; then
	status=''
else
	status=''
fi

echo "$status $capacity%"
