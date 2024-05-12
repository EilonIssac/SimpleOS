#!/bin/bash

cp /etc/xmenu/minimize.sh /etc/xmenu/min_tray.sh

if [[ "$(hidden)" != "" ]]
then
	while read line
	do
		min_list=$(echo -e "$(echo "$line" | awk -F\' '{ print $2 }')""\t$(echo "$line" | awk -F\' '{ print $4 }')")

		class_name=$(xdotool getwindowclassname $(echo $min_list | awk 'NF>1 { print $NF }' | sed "s/'//"))

		icon_path="/home/$USER/xmenu_icons/""$(cat /home/$USER/xmenu_icons/icon_list | grep "$class_name" | awk -F ' : ' '{ print $2 }')"

		min_list="IMG:$icon_path""\t"$min_list

		echo -e "$min_list" >> /etc/xmenu/min_tray.sh
	done < <(hidden -c)
fi

echo -e "EOF" >> /etc/xmenu/min_tray.sh
