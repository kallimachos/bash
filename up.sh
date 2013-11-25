#!/bin/bash

file="/home/bmoss/scripts/bash/date.txt"
day=$(cat "$file")
today=$(date +%j)
if [ "$day" != "$today" ]; then
	echo $today > "$file"
	kinit
fi

for dir in ~/CloudForms/*; do (cd "$dir" && echo 'CloudForms' && svn up); done
for dir in ~/Storage/*; do (cd "$dir" && echo 'Storage' && svn up); done