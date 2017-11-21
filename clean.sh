#!/bin/bash

# Runs 'git clean -xfd' and 'git remote prune origin' on repositories in listed
# directories.

bash ~/scripts/bash/repocheck.sh
echo -n "Proceed with git clean? (y/n): "
read proceed
if [ "$proceed" != "y" ]; then
    exit
else
    echo "Cleaning git repos..."
fi
echo

repos=(openstack mongodb mongodb/docs code code/python scripts)

for item in ${repos[@]}; do
    root=~/$item/*
    for dir in $root; do
        if test -d $dir && test -e $dir/.git; then
            if [ $dir == ~/rpcdocs/internal-docs-rpc ]; then
                true
            else
                cd $dir && echo $dir
                git clean -xfd && git remote prune origin
            fi
        fi
    done
done
echo
