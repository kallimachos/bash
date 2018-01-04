#!/bin/bash

# Preps environment for kbdash development

echo -n "Setting environment variables for CAB... "
source ~/Desktop/cloudinary.sh
echo "done"

echo -e "\nStarting mongod..."
mongod --fork --logpath /data/db/mongod.log

echo -e "\nStarting keystone..."
node ~/mongodb/community-support/keystone.js
