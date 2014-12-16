#!/bin/bash

touch /home/bmoss/scripts/bash/profile.log
log="/home/bmoss/scripts/bash/profile.log"

echo "Curl executed: $(date)" >> $log
curl profile-mythos.rhcloud.com > /dev/null
echo