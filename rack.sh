#!/bin/bash

for dir in ~/rackspace/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git pull
	fi
done