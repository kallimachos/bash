#!/bin/bash

# Runs 'git pull' on all my personal git repositories.

div='======================'
repos=(code code/python scripts)

echo $div
echo 'My GitHub Repositories'
echo $div
for item in ${repos[@]}; do
    root=~/$item/*
    for dir in $root; do
        if test -d $dir && test -e $dir/.git; then
            cd $dir && git pull --prune
        fi

    done
done
echo
