#!/bin/bash

error="\nError. Check that xmenu.sh in your home directory is formatted correctly.\n\n"

help() {
	if [ $# -le 1 ]; then
		printf "\nAvailable arguments:\n\n\
--help [command]\n\n"

		printf "Available Commands:\n\n\
add-category\n\n\
add-item\n\n\
remove-entry\n\n"
	else
		printf "\nThe \"help\" command does not support any arguments.\n\n"
	fi
}

--help() {
	case "${@: -1}" in
		add-category)
			printf "\nUsage: xlaunch add-category [image-filename] [category-title]\n\nPlace images in xmenu_icons in your home directory.\n\n"
			;;
		remove-entry)
			printf "\nUsage: xlaunch remove-entry [category-title/time-title]\n\n"
			;;
		add-item)
			printf "\nUsage: xlaunch add-item [image-filename] [item-title] [command] [category]\n\nPlace images in xmenu_icons in your home directory.\n\n"
			;;
	esac
}

add-category () {
	image_filename=$2
	title=$3

	if [ $# -gt 2 ]; then
		printf "\nToo many arguments.\n\n"
		--help add-category
	elif [ $# -lt 2 ]; then
		printf "\nNot enough arguments.\n\n"
		--help add-category
	elif [ $# -eq 2 ]; then
		parsed_entry="IMG:/home/"$USER"/xmenu_icons/"$image_filename"\t"$title"\t"$command
		sed -i '$ i\'"$parsed_entry" /home/"$USER"/xmenu.sh

		if [ $? -eq 0 ]; then
			printf "\nCategory Added.\n\n"
		else
			printf $error
		fi
	fi
}

remove-entry() {
	title=$2

	if [ $# -gt 2 ]; then
		printf "\nToo many arguments.\n\n"
		--help remove-entry
	elif [ $# -lt 2 ]; then
		printf "\nNot enough arguments.\n\n"
		--help remove-entry
	elif [ $# -eq 2 ]; then
		sed -i '/'"$title"'/d' /home/"$USER"/xmenu.sh

		if [ $? -eq 0 ]; then
			printf "\nEntry Removed.\n\n"
		else
			printf $error
		fi
	fi
}

add-item() {
	image_filename=$2
	title=$3
	command=$4
	category=$5

	if [ $# -gt 5 ]; then
		printf "\nToo many arguments.\n\n"
		--help add-item
	elif [ $# -lt 5 ]; then
		printf "\nNot enough arguments\n\n"
		--help add-item
	elif [ $# -eq 5 ]; then
		parsed_entry="\\\\t""IMG:/home/$USER""/xmenu_icons/"$image_filename"\t"$title"\t"$command
		sed -i "/$category/a $parsed_entry" /home/"$USER"/xmenu.sh

		if [ $? -eq 0 ]; then
			printf "\nItem added.\n\n"
		else
			printf $error
		fi
	fi
}

$1 $@

if [ $# -eq 0 ]; then
	help
fi
