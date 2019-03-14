#!/bin/bash

# Runs the listed 'git pull' scripts.

div='======================'

echo
# echo $div
# echo 'OpenStack Repositories'
# echo $div
# echo 'Skipping...'
# bash ~/scripts/bash/stack.sh
# echo

echo $div
echo 'MongoDB Repositories'
echo $div
bash ~/scripts/bash/mup.sh
echo

echo $div
echo 'My GitHub Repositories'
echo $div
bash ~/scripts/bash/mygit.sh
echo
