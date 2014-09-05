#!/bin/bash

for dir in ~/code/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git pull
	fi
done

for dir in ~/code/python/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git pull
	fi
done

for dir in ~/scripts/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git pull
	fi
done
