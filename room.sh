#!/bin/bash

file="/home/bmoss/Dropbox/The_Room.txt"
backup="/home/bmoss/Documents/personal/The_Room.txt"
if [ "$1" = "" ]; then
	gnome-open $file
else
	echo >> "$file"
	echo $1 >> "$file"
	new=$(tail -1 "$file")
	test "$new" = "$1" ; echo "Confirmed"
	echo >> "$backup"
	echo $1 >> "$backup"
	new=$(tail -1 "$backup")
	test "$new" = "$1" ; echo "Backup Confirmed"
fi