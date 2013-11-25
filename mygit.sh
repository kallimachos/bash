#!/bin/bash

for dir in ~/code/python/*; do
	cd "$dir"
	if test -e .git; then
		git pull
	fi
done