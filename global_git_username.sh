#!/bin/bash

# Prints the configured git user.name for all openstack and rpcdocs repos.

for dir in ~/openstack/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git config -l | grep user.name
        echo
    fi
done

for dir in ~/rpcdocs/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git config -l | grep user.name
        echo
    fi
done
