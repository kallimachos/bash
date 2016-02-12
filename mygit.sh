#!/bin/bash

# Runs 'git pull' on all my personal git repositories.

repos=(code code/python scripts)

echo
for item in ${repos[@]}; do
    root=~/$item/*
    for dir in $root; do
        if test -d $dir && test -e $dir/.git; then
            cd $dir && git pull
        fi

    done
done
echo
