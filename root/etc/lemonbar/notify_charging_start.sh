#!/bin/bash

function close_notification() {
	dunstctl close
}

function clear_notification() {
	close_notification
	dunstctl history-rm "$1"
}

ACTION=$(dunstify --action="close_notification,Close" --action "clear_from_history,Clear" "Charging Started" "Current Battery: ""$(cat /sys/class/power_supply/BAT0/capacity)""%" -t 5000)

ID=$(dunstctl count | grep History | awk '{ print $2 }')
ID=$((ID+1))

case $ACTION in
	"close_notification")
		close_notification
		;;
	"clear_from_history")
		clear_notification $ID
		;;
esac
