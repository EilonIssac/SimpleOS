#!/bin/bash

tray_id=$(xdotool search --name stalonetray)

if [[ "$(cat /etc/tray/tmp/state)" == "1" ]]; then
	xdotool windowunmap $tray_id
	echo "0" > /etc/tray/tmp/state
fi
