#!/bin/bash

for dir in ~/rpcdocs/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git fetch upstream
        git merge upstream/master
        git push origin master
    fi
done
