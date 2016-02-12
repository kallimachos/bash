#!/bin/bash

# Merges local v10 branch with upstream and pushes the result to origin

git checkout v10
git fetch upstream
git merge upstream/v10
git push origin v10
git branch
