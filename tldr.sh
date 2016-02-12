#!/bin/bash

# Opens tldr.txt if no argument; else appends string to tldr.

file=~/Rackspace/tldr.txt
if [ "$1" = "" ]; then
    open -a "Komodo Edit 9" $file
elif [ "$1" = "wc" ]; then
    echo "Word count: "
    wc -w $file
else
    echo >> "$file"
    echo $1 >> "$file"
    new=$(tail -1 "$file")
    test "$new" = "$1" ; echo "Confirmed"
fi
