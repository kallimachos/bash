#!/bin/bash

file="/home/bmoss/Dropbox/The_Room.txt"
if [ "$1" = "" ]; then
	gnome-open $file
else
	echo >> "$file"
	echo $1 >> "$file"
	new=$(tail -1 "$file")
	test "$new" = "$1" ; echo "Confirmed"
fi