#!/bin/bash

# Merges upstream develop branch into local develop branch for a repository and
# pushes the result to origin.

git remote update
git checkout develop
git rebase upstream/develop
git push origin develop
git status
