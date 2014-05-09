#!/bin/bash

for dir in ~/OpenShift/*; do
	cd "$dir"
	if test -e .git; then
		echo -e "\e[1;35m$dir\e[00m"
		git branch -a && echo
	fi
done