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

echo -n "Publish (a)ll, (r)el and tech notes, (e)verthing except rel and tech notes, (c)ancel: "
read books

if [ "$books" == "c" ]; then
	echo -e "Publish cancelled on user command.\n"
	exit 1
else
	echo -n "Assemble? (y/n): "
	read assemble

	if [ "$assemble" == "y" ]; then
		echo "Assembling books..."
		if [ "$books" == "a" ]; then
			for dir in $loc/*; do (cd "$dir" && csprocessor assemble --hide-output); done
		elif [ "$books" == "r" ]; then
			cd $rel && csprocessor assemble --hide-output
			cd $tech && csprocessor assemble --hide-output
		else
			for dir in $loc/*; do
				if [ "$dir" != $rel -a "$dir" != $tech ] ; then
					cd "$dir" && csprocessor assemble --hide-output
				fi
			done
		fi
	fi

	test -e $loc/packages.txt && rm $loc/packages.txt
	echo "Building packages..."

	if [ "$books" == "a" ]; then
		for dir in $loc/*; do
			cd "$dir"/assembly/publican
			packagelist
		done
		echo
	elif [ "$books" == "r" ]; then
		cd "$rel"/assembly/publican && packagelist
		cd "$tech"/assembly/publican && packagelist
		echo
	else
		for dir in $loc/*; do
			if [ "$dir" != $rel -a "$dir" != $tech ] ; then
				cd "$dir"/assembly/publican
				packagelist
			fi
		done
		echo
	fi

	echo -n "Confirm publish (y/n): "
	read publish

	if [ "$publish" == "n" ]; then
		echo -e "Publish cancelled on user command.\n"
		exit 1
	else
		echo "Tagging packages into docs-rhel-6..."
		while read line; do
			brew tag-build docs-rhel-6 "$line"
		done < $loc/packages.txt
		echo -e "Tagging complete.\n"
	fi
fi