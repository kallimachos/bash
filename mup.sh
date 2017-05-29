#!/bin/bash

# Merges upstream into local master branches for MongoDB repositories
# and pushes the results to origin.

for dir in ~/mongodb/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git fetch upstream
        git merge upstream/master
        git push origin master
    fi
done
