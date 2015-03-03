#!/bin/bash

bash ~/scripts/bash/testdate.sh

sudo yum update -y --skip-broken
echo

echo 'OpenStack Repositories:'
bash ~/scripts/bash/stack.sh
echo

echo 'RHCI Repositories:'
bash ~/scripts/bash/rhci.sh
echo

echo 'My GitHub Repositories:'
bash ~/scripts/bash/mygit.sh

#for dir in ~/CloudForms/*; do
#	if test -d "$dir"; then
#		cd "$dir"
#		if test -e .svn; then
#			echo "$dir" && svn up && echo
#		fi
#	fi
#done

#for dir in ~/csp/cloudforms/3.0/*; do (cd "$dir" && csprocessor pull); done
#for dir in ~/csp/cloudforms/3.1/*; do (cd "$dir" && csprocessor pull); done