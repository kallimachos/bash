#!/bin/bash

for dir in ~/OpenShift/*; do
	cd "$dir"
	if test -e .git; then
		echo $dir
		git checkout master && echo
	fi
done