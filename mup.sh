#!/bin/bash

# Git pull or merge upstream into local master branches for MongoDB repositories
# then push result to origin if required.

for dir in ~/mongodb/*; do
    if [[ "$dir" == *"kb"* ]]; then
        cd $dir
        git pull
    elif test -d $dir && test -e $dir/.git; then
        cd $dir
        git fetch upstream
        git merge upstream/master
        git push origin master
    fi
done
for dir in ~/mongodb/docs/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git fetch upstream
        git merge upstream/master
        git push origin master
    fi
done
