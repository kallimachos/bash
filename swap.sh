#!/bin/bash

loc=$(pwd)
if [[ $loc == $HOME/csp/online/* ]]; then
	loc=$(sed "s/online/enterprise/g" <<< "$loc")
	echo "Online -> Enterprise"
	cd $loc
elif [[ $loc == $HOME/csp/enterprise/* ]]; then
	echo "Enterprise -> Online"
	loc=$(sed "s/enterprise/online/g" <<< "$loc")
	cd $loc
else
	echo "Not a valid swap directory."
fi