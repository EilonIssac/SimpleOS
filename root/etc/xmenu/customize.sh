#!/bin/sh

cat <<EOF | xmenu -p 130x24 | sh &
Personalize Desktop
	Change Desktop Background	alacritty -e /etc/9menu/change_background.sh
EOF
