#!/bin/bash

# Updates Fedora and pip packages.
if [[ `uname` == 'Linux' ]]; then
    echo 'sudo freshclam'
    sudo freshclam
    echo -e "\n----------\n"
    echo 'sudo dnf update -y'
    sudo dnf update -y
    echo -e "\n----------\n"
fi

echo 'sudo pip-review --auto'
sudo pip-review --auto
echo
