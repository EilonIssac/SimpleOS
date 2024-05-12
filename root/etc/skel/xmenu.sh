#!/bin/sh

cat	<<EOF	|	xmenu	|	sh	&

IMG:./xmenu_icons/terminal.png	Terminals
	IMG:./xmenu_icons/Alacritty_logo.svg	Alacritty	alacritty
	IMG:./xmenu_icons/xterm.svg	XTerm	xterm
IMG:./xmenu_icons/web.png	Web Browsers
	IMG:./xmenu_icons/chrome.png	Google Chrome	google-chrome-stable
IMG:./xmenu_icons/file_manager.png	File Managment
	IMG:./xmenu_icons/nautilus.svg	Nautilus	nautilus -w
IMG:./xmenu_icons/text_editor.png	Text Editing
	IMG:./xmenu_icons/standard_notes.svg	Standard Notes	standard-notes
	IMG:./xmenu_icons/notepadqq.svg	Notepad QQ	notepadqq
IMG:./xmenu_icons/gaming.png	Gaming
	IMG:./xmenu_icons/steam.svg	Steam	steam
IMG:./xmenu_icons/misc.png	Other Applications
	IMG:./xmenu_icons/blender.png	Blender	blender
EOF
