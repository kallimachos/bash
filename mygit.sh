#!/bin/bash

for dir in ~/code/*; do
	cd "$dir"
	if test -e .git; then
		git pull
	fi
done

for dir in ~/code/python/*; do
	cd "$dir"
	if test -e .git; then
		git pull
	fi
done

for dir in ~/scripts/*; do
	cd "$dir"
	if test -e .git; then
		git pull
	fi
done
