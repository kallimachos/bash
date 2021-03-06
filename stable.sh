#!/bin/bash

# Merges upstream into local stable branches and pushes the results to origin.

branches=(v11 v12 v13 v14)

echo
for item in ${branches[@]}; do
    git checkout $item
    git fetch upstream
    git merge upstream/$item
    git push origin $item
done
git checkout master
git branch
echo
