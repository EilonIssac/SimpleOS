#!/bin/bash

while read -r package; do
	yay -Sy --needed --noconfirm --answerdiff=None --answeredit=None $package || echo "Failed to install $package"
done < pkg.list

chmod -R 555 root/etc
chmod -R 555 usr/bin

sudo cp -r root/etc/* /etc
sudo cp -r usr/bin/* /usr/bin
