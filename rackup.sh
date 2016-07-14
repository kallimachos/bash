#!/bin/bash

# Merges local master branches for Rackspace repositories with upstream
# and pushes the results to origin.

for dir in ~/rpcdocs/*; do
    if test -d $dir && test -e $dir/.git; then
        if [ "$1" == "y" ]; then
            cd $dir
            git fetch upstream
            git merge upstream/master
            git push origin master
        else
            cd $dir
            if [ $dir == ~/rpcdocs/internal-docs-rpc ]; then
                true
            else
                git fetch upstream
                git merge upstream/master
                git push origin master
            fi
        fi
    fi
done
