#!/bin/bash

# Updates Fedora and pip packages.

echo 'sudo dnf update -y'
sudo dnf update -y
echo

echo 'sudo pip-review --auto'
sudo pip-review --auto
echo
