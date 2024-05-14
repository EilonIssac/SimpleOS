#!/bin/bash

while read -r package; do
	yay -Sy --needed --noconfirm --answerdiff=None --answeredit=None $package || echo "Failed to install $package"
done < pkg.list

sudo chmod -R 555 root/etc
sudo chmod -R 555 usr/bin

sudo rsync -av root/etc /etc
sudo rsync -av usr/bin /usr/bin
