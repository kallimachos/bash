#!/bin/bash

# Git pull origin into local tracking branches for MongoDB repositories
div='======================'

echo
echo $div
echo 'MongoDB Repositories'
echo $div
for dir in ~/mongodb/*; do
    if [[ -d $dir && -e $dir/.git ]]; then
        cd $dir && git pull --prune &
    fi
done
wait
echo
