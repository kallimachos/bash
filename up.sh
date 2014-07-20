#!/bin/bash

bash /home/bmoss/scripts/bash/testdate.sh

sudo yum update -y --skip-broken

echo

for dir in ~/CloudForms/*; do
	if test -d "$dir"; then
		cd "$dir"
		if test -e .svn; then
			echo "$dir" && svn up && echo
		fi
	fi
done

for dir in ~/csp/cloudforms/3.0/*; do (cd "$dir" && csprocessor pull); done
for dir in ~/csp/cloudforms/3.1/*; do (cd "$dir" && csprocessor pull); done