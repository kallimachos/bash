#!/bin/bash

# Git pull or merge upstream into local master branches for MongoDB repositories
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
#     git merge upstream/master
#     git push origin master
# fi
