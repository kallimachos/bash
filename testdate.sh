#!/bin/bash

# Echos today's date to date.txt

file="~/scripts/bash/date.txt"
day=$(cat "$file")
today=$(date +%j)
if [ "$day" != "$today" ]; then
    echo $today > "$file"
    # kinit
fi
