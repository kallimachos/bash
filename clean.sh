#!/bin/bash

# Runs 'git clean -xfd' on listed repositories.

bash ~/scripts/bash/repocheck.sh
echo -n "Proceed with git clean? (y/n): "
read proceed
if [ "$proceed" != "y" ]; then
    exit
else
    echo "Cleaning git repos..."
fi
echo

repos=(openstack rpcdocs code code/python scripts)

echo
for item in ${repos[@]}; do
    root=~/$item/*
    for dir in $root; do
        if test -d $dir && test -e $dir/.git; then
            cd $dir && git clean -xfd
        fi
    done
done
echo
