#!/bin/bash

# Merges local stable branches with upstream and pushes the results to origin.

branches=(v10 v11 v12)

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
