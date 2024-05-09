#!/bin/bash

# Git pull origin into local tracking branches for MongoDB repositories
div='======================'

echo
echo $div
echo 'MongoDB Repositories'
echo $div
for dir in ~/mongodb/*; do
    if [[ -d $dir && -e $dir/.git && $(basename $dir) == ts* ]]; then
        cd $dir && git pull --prune &
    elif [[ -d $dir && -e $dir/.git && $(basename $dir) == kb* ]]; then
        cd $dir && git checkout main && git pull && git checkout staging && git pull --prune &
    fi
done
wait
echo
