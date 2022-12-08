#!/bin/bash

# Runs 'git pull' on all my personal git repositories.

repos=(code code/python scripts)

for item in ${repos[@]}; do
    root=~/$item/*
    for dir in $root; do
        if test -d $dir && test -e $dir/.git; then
            cd $dir && git pull --prune
        fi

    done
done
