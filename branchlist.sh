#!/bin/bash

# Lists local branches for all repositories.

div='======================'

echo
echo $div
echo 'OpenStack Repositories'
echo $div

for dir in ~/openstack/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        tput setaf 24 && echo "${PWD##*/}" && tput sgr0
        git branch
    fi
done

echo
echo $div
echo 'Rackspace Repositories'
echo $div

for dir in ~/rpcdocs/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir
        tput setaf 24 && echo "${PWD##*/}" && tput sgr0
        git branch
    fi
done

echo
echo $div
echo 'My GitHub Repositories'
echo $div

repos=(code code/python scripts)

for item in ${repos[@]}; do
    root=~/$item/*
    for dir in $root; do
        if test -d $dir && test -e $dir/.git; then
            cd $dir
            tput setaf 24 && echo "${PWD##*/}" && tput sgr0
            git branch
        fi
    done
done
