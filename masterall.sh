#!/bin/bash

for dir in ~/OpenShift/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
		git checkout master && echo
	fi
done