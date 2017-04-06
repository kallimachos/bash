#!/bin/bash

# Updates Fedora and pip packages.
if [[ `uname` == 'Linux' ]]; then
    echo 'sudo freshclam'
    sudo freshclam
    sudo dnf update -y
    echo 'sudo dnf update -y'
    echo
fi

echo 'sudo pip-review --auto'
sudo pip-review --auto
echo
