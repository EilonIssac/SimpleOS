#!/bin/sh

cat <<EOF | xmenu -p 231x24 | sh &
IMG:/home/$USER/xmenu_icons/minimize.png	Minimize A Window	/etc/xmenu/min.sh
EOF
