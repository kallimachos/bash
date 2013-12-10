#!/bin/bash

bash /home/bmoss/scripts/bash/testdate.sh

for dir in ~/CloudForms/*; do (cd "$dir" && echo 'CloudForms' && svn up && echo); done
for dir in ~/csp/cloudforms/*; do (cd "$dir" && csprocessor pull); done