#!/bin/bash

while read -r package; do
	sudo pacman -S --needed --noconfirm $package || echo "Failed to install $package"
	yay -Sy --needed --noconfirm --answerdiff=None --answeredit=None $package || echo "Failed to install $package"
done < pkg.list
