#!/bin/sh

display_calendar() {
	notify-send "$(cal)" "\n$(date +'%A (%F)')"
}

display_world_clock() {
	dfw_time="$(TZ='America/Chicago' date +'DFW: %a %F %r')"
	bne_time="$(TZ='Australia/Brisbane' date +'BNE: %a %F %r')"
	times="$bne_time\n$dfw_time"
	notify-send 'World Clock' "$times"
}

display_next_appointment() {
	notify-send -t 15000 "Upcoming appointment" "$(calcurse -n | grep -o '\[.*')"
}


case "$BLOCK_BUTTON" in
	1) display_calendar ;;
	2) display_next_appointment ;;
	3) display_world_clock ;;
esac

echo "$(date +' %F')"

if [ "$(date +'%I:%M:%S')" = '11:11:11' ]; then
	notify-send -t 10000 'Make a wish!'
fi

if [ "$(date +'%I:%M:%S')" = '9:30:00' ]; then
	notify-send -t 30000 'TAKE YOUR MEDS, SCHIZO!'
fi
