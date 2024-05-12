#!/bin/bash

Clock() {
        DATETIME=$(date "+%a %b %d, %r")
        printf "%s$DATETIME"
}

Battery() {
        BATPERC=$(cat /sys/class/power_supply/BAT0/capacity)

        if [ "$BATPERC" -gt "50" ]; then
                result="\uf240"
        elif [ "$BATPERC" -le "50" ]; then
                result="\uf242"
        fi

        if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Charging" ]]; then
		if [[ "$(cat /etc/lemonbar/previous_charge_query)" == "0" ]]; then
			/etc/lemonbar/notify_charging_start.sh &
		fi

		echo "1" > /etc/lemonbar/previous_charge_query
                result="\uf5df"
	elif [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Discharging" ]]; then
		if [[ "$(cat /etc/lemonbar/previous_charge_query)" == "1" ]]; then
			/etc/lemonbar/notify_charging_stop.sh &
		fi

		echo "0" > /etc/lemonbar/previous_charge_query
        fi

        echo -e "$result""$BATPERC""%"
}

Dropdown() {
        state=$(cat /etc/tray/tmp/state)
        if [[ $state == "0" ]]; then
                result="\uf0de"
        elif [[ $state == "1" ]]; then
                result="\uf0dd"
        fi
        echo -e "$result"
}

while true
do
        echo -e "%{A:/etc/xmenu/menu_wq.sh &:}  Menu%{A} %{A:/etc/lemonbar/start_sound.sh &:} Sound%{A} %{A:/etc/lemonbar/settings.sh &:} Settings%{A} %{A:/etc/xmenu/gen_minimize.sh; /etc/xmenu/min_tray.sh &:} Windows%{A} %{A:kill -9 -1:} Logout%{A} %{r} $(Clock)    $(Battery)  %{A:/etc/lemonbar/notifications.sh:} ! %{A}  %{A:/etc/tray/toggle_tray.sh:}    $(Dropdown)    %{A}" 
        sleep 0.1
done
