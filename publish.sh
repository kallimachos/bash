#!/bin/bash

echo -n "Enter CloudForms version: "
read version

loc=~/csp/cloudforms/$version
rel=$loc/Release_Notes
tech=$loc/Technical_Notes

echo -n "Publish (a)ll, (r)el and tech notes, (e)verthing except rel and tech notes, (c)ancel: "
read books

if [ "$books" == "c" ]; then
	echo "Publish cancelled on user command."
	exit 1
else
	echo "Building packages..."
	rm $loc/packages.txt

	if [ "$books" == "a" ]; then
		for dir in $loc/*; do
			cd "$dir"/assembly/publican
			package=$(publican package --lang en-US | tail --lines=1)
			echo ${package#*rpm/}
			echo ${package#*rpm/} >> $loc/packages.txt
		done
		echo
	elif [ "$books" == "r" ]; then
		cd "$rel"/assembly/publican && package=$(publican package --lang en-US | tail --lines=1) && echo ${package#*rpm/} && echo ${package#*rpm/} >> $loc/packages.txt
		cd "$tech"/assembly/publican && package=$(publican package --lang en-US | tail --lines=1) && echo ${package#*rpm/} && echo ${package#*rpm/} >> $loc/packages.txt
		echo
	else
		for dir in $loc/*; do
			if [ "$dir" != $rel -a "$dir" != $tech ] ; then
				cd "$dir"/assembly/publican
				package=$(publican package --lang en-US | tail --lines=1)
				echo ${package#*rpm/}
				echo ${package#*rpm/} >> $loc/packages.txt
			fi
		done
		echo
	fi

	echo -n "Confirm publish (y/n): "
	read publish

	if [ "$publish" == "n" ]; then
		echo "Publish cancelled on user command."
		exit 1
	else
		echo "Tagging packages live..."
		while read line; do
			brew tag-build docs-rhel-6 "$line"
		done < $loc/packages.txt
		echo -e "Tagging complete.\n"
	fi
fi