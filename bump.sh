#!/bin/bash

# Merges upstream into local branch for a repository and pushes the
# result to origin.

git fetch upstream
git merge upstream/main
git push origin main
