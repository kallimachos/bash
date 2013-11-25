#!/bin/bash

file="/home/bmoss/Documents/personal/The_Room"
if [ "$1" = "" ]; then
	go $file
else
	echo >> "$file"
	echo $1 >> "$file"
	new=$(tail -1 "$file")
	test "$new" = "$1" ; echo "Confirmed"
fi