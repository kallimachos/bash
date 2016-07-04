#!/bin/bash

# Merges local branch for a Rackspace repository with upstream
# and pushes the result to origin.

git fetch upstream
git merge upstream/master
git push origin master
