#!/bin/bash

# Show commits in main that are not in prod

repos=(kbapi kbdash kbhub kbtools)

echo
for repo in ${repos[@]}; do
    dir=~/mongodb/$repo
    cd $dir && echo $dir
    branch=$(git status -s -b)
    git log prod..main --format="%h - %ad - %s" --date=format:'%b %d %Y'
    echo
done
