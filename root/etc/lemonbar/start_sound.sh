#!/bin/bash

pavucontrol &

while true; do
	window_id=$(xdotool search --pid $!)

	if [ $? -eq 0 ]; then
		for id in $window_id; do
			xdotool windowmove "$id" 00 00
			xdotool windowmove "$id" 00 25
		done

		break

		fi

		sleep 0.1

done


