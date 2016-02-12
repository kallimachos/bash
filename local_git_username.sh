#!/bin/bash

# Sets the username for my personal repos to kallimachos.

for dir in ~/code/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git config --local user.name kallimachos
        #git config -l | grep user.name && echo
    fi
done

for dir in ~/code/python/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git config --local user.name kallimachos
        #git config -l | grep user.name && echo
    fi
done

for dir in ~/scripts/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        git config --local user.name kallimachos
        #git config -l | grep user.name && echo
    fi
done

echo "Complete"
