#!/bin/bash

if [ $(brightnessctl g) -le 10 ]; then
exit
fi
brightnessctl s 20-
