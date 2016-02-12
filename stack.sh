#!/bin/bash

# Runs 'git pull' on openstack repos

for dir in ~/openstack/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir && git pull
    fi
done
