#!/bin/bash

# Git pull or merge upstream into local main branches for MongoDB repositories
# then push result to origin if required.

for dir in ~/mongodb/*; do
    if test -e $dir/.git; then
        cd $dir
        git pull
    fi
done

# if test -d $dir && test -e $dir/.git; then
#     cd $dir
#     git fetch upstream
#     git merge upstream/main
#     git push origin main
# fi
