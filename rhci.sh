#!/bin/bash

for dir in ~/rhci/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git pull
	fi
done