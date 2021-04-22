#!/bin/bash

# Print 'git status -s -b' of repos in the listed directories if they have
# uncommitted changes or if they are not on the master or main branch.

repos=(mongodb mongodb/docs code code/python scripts)
branches=("## master...origin/master" "## main...origin/main")

echo
for item in ${repos[@]}; do
    root=~/$item/*
    for dir in $root; do
        if test -d $dir && test -e $dir/.git; then
            cd $dir && echo $dir
            branch=$(git status -s -b)
            if [[ " ${branches[*]} " == *"$branch"* ]]; then
                true
            else
                git status -s -b
            fi
        fi
    done
done
echo
