#!/bin/bash

for dir in ~/code/python/*; do
	cd "$dir"
	if test -e .git; then
		echo $dir
		git status -s && echo
	fi
done

for dir in ~/scripts/*; do
	cd "$dir"
	if test -e .git; then
		echo $dir
		git status -s && echo
	fi
done