#!/bin/bash

if [[ $(cat /etc/lemonbar/notification_tray_status) == "0" ]]; then
	notifications=$(dunstctl count | grep History | awk '{ print $2 }')
	notifications=$((notifications+1))

	while [ $notifications -gt 0 ]; do
		dunstctl history-pop $notifications
		notifications=$((notifications-1))
	done

	echo "1" > /etc/lemonbar/notification_tray_status
elif [[ $(cat /etc/lemonbar/notification_tray_status) == "1" ]]; then
	dunstctl close-all
	echo "0" > /etc/lemonbar/notification_tray_status
fi

