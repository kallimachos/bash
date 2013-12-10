#!/bin/bash

#run kinit if required
bash /home/bmoss/scripts/bash/testdate.sh

#csprocessor repos
bash /home/bmoss/scripts/bash/pullcsp.sh

#git repos
bash /home/bmoss/scripts/bash/pullos.sh
bash /home/bmoss/scripts/bash/mygit.sh

#svn repos
for dir in ~/CloudForms/*; do (cd "$dir" && echo 'CloudForms' && svn up && echo); done