#!/bin/bash

echo -n "Enter CloudForms version: "
read version

loc=~/csp/cloudforms/$version
rel=$loc/Release_Notes
tech=$loc/Technical_Notes

function packagelist {
	package=$(publican package --lang en-US | tail --lines=1)
	package=${package#*rpm/} && package=${package/.src*/eng}
	echo $package && echo $package >> $loc/packages.txt
}

echo -n "View packages (y/n): "
read packages
test -e $loc/packages.txt && rm $loc/packages.txt

if [ "$packages" == "y" ]; then
	echo "Building packages..."
    for dir in $loc/*; do
		cd "$dir"/assembly/publican
		packagelist
	done
    echo
fi

echo -n "Assemble (a)ll, (r)el and tech notes, (e)verthing except rel and tech notes, (c)ancel: "
read books

if [ "$books" == "a" ]; then
	for dir in $loc/*; do (cd "$dir" && csprocessor assemble --hide-output); done
elif [ "$books" == "r" ]; then
	cd $rel && csprocessor assemble --hide-output
	cd $tech && csprocessor assemble --hide-output
elif [ "$books" == "c" ]; then echo -e "Exiting on user command.\n"
else
	for dir in $loc/*; do
		if [ "$dir" != $rel -a "$dir" != $tech ] ; then
			cd "$dir" && csprocessor assemble --hide-output
		fi
	done
fi