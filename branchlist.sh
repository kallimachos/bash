#!/bin/bash

for dir in ~/OpenShift/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir
		echo -e "\e[1;35m$dir\e[00m"
		git branch -a && echo
	fi
done