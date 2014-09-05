#!/bin/bash

for dir in ~/code/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
        git status -s
    fi
done

for dir in ~/code/python/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
		git status -s
	fi
done

for dir in ~/scripts/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
		git status -s
	fi
done
