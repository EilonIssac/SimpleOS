#!/bin/bash

while true
do
	if [[ "$(xdotool getmouselocation | awk '{ print $4 }' | cut -c8-)" != "1570" ]]; then
		killall xbindkeys
	elif [[ "$(ps aux | grep xbindkeys | awk '{ print $11 }' | head -1)" != "xbindkeys" ]]; then
		xbindkeys
	fi
	sleep 0.15
done
