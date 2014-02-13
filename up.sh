#!/bin/bash

bash /home/bmoss/scripts/bash/testdate.sh

for dir in ~/CloudForms/*; do
	if test -d "$dir"; then
		cd "$dir"
		if test -e .svn; then
			echo "$dir" && svn up && echo
		fi
	fi
done

for dir in ~/csp/cloudforms/*; do (cd "$dir" && csprocessor pull); done