#!/bin/sh

cat <<EOF | xmenu -p 0x24| sh &
User
	Logout	kill -9 -1
System
	Shutdown	poweroff
	Reboot And Return to Windows	reboot
	Panic	/etc/9menu/panic.sh
EOF
