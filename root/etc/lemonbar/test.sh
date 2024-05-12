#!/bin/bash

python /etc/lemonbar/settings.py &
wait
window_id=$(xdotool search --pid $!)
xdotool windowmove $window_id 0 25
