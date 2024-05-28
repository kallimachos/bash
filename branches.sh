#!/bin/bash

# Lists local branches for all repositories.
div='======================'

echo
echo $div
echo 'MongoDB Repositories'
echo $div
for dir in ~/mongodb/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        tput setaf 24 && echo "${PWD##*/}" && tput sgr0
        git branch
    fi
done
echo
