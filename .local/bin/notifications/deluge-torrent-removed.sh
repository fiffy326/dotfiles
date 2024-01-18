#!/bin/sh

torrent_id="$1"
torrent_name="$2"
torrent_path="$3"

notify-send --icon='deluge' 'Torrent removed' "$torrent_name"

# vim:set ts=4 sts=4 sw=4:
