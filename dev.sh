#!/bin/bash

# Preps environment for kbdash development

# echo -n "Setting environment variables for CAB... "
# source ~/Documents/cloudinary.sh
echo -n "Using .env to set environment variables for CAB... "
echo "done"

echo -e "\nStarting mongod..."
mongod --fork --logpath /data/db/mongod.log

echo -e "\nStarting keystone..."
node ~/mongodb/community-support/keystone.js
