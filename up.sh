#!/bin/bash

# Runs the listed 'git pull' scripts.

echo
echo 'OpenStack Repositories:'
bash ~/scripts/bash/stack.sh
echo

echo 'Rackspace Repositories:'
bash ~/scripts/bash/rackup.sh
echo

echo 'My GitHub Repositories:'
bash ~/scripts/bash/mygit.sh
echo
