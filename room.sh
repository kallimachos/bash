#!/bin/bash

file=~/Dropbox/The_Room.txt
backup=~/Documents/The_Room.txt
if [ "$1" = "" ]; then
    open $file
elif [ "$1" = "wc" ]; then
    echo "Word count: "
    wc -w $file
    wc -w $backup
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
