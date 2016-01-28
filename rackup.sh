#!/bin/bash

for dir in ~/rpcdocs/*; do
    if test -d $dir && test -e $dir/.git; then
        if [ "$1" == "y" ]; then
            cd $dir
            git fetch upstream
            git merge upstream/master
            git push origin master
        else
            cd $dir
            if [ $dir == ~/rpcdocs/docs-internal ]; then
                true
            else
                git fetch upstream
                git merge upstream/master
                git push origin master
            fi
        fi
    fi
done
