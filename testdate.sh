#!/bin/bash

file="/Users/bmoss/scripts/bash/date.txt"
day=$(cat "$file")
today=$(date +%j)
if [ "$day" != "$today" ]; then
	echo $today > "$file"
	kinit
fi