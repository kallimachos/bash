#!/bin/bash

# Updates Fedora and pip packages.
if [[ `uname` == 'Linux' ]]; then
    echo 'sudo dnf update -y'
    sudo dnf update -y
    echo
fi

echo 'sudo pip-review --auto'
sudo pip-review --auto
echo
