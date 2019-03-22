#!/bin/bash

# Runs 'git clean -xfd' and 'git remote prune origin' on repositories in listed
# directories.

bash ~/scripts/bash/repocheck.sh

repos=(mongodb mongodb/docs code code/python scripts)

echo -n "Check what files will be cleaned? (y/n): "
read check
if [ "$check" == "y" ]; then
    echo "Checking git repos..."
    for item in ${repos[@]}; do
        root=~/$item/*
        for dir in $root; do
            if test -d $dir && test -e $dir/.git; then
                if [ $dir == ~/rpcdocs/internal-docs-rpc ]; then
                    true
                else
                    cd $dir && echo -e "\033[92m$dir\033[0m"
                    git clean -xnd -e .env && git remote prune origin
                fi
            fi
        done
    done
    echo
fi

echo -n "Proceed with git clean? (y/n): "
read proceed
if [ "$proceed" != "y" ]; then
    exit
else
    echo "Cleaning git repos..."
    for item in ${repos[@]}; do
        root=~/$item/*
        for dir in $root; do
            if test -d $dir && test -e $dir/.git; then
                if [ $dir == ~/rpcdocs/internal-docs-rpc ]; then
                    true
                else
                    cd $dir && echo -e "\033[92m$dir\033[0m"
                    git clean -xfd -e .env && git remote prune origin
                fi
            fi
        done
    done
    echo
fi
echo
