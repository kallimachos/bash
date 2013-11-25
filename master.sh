#!/bin/bash

loc=$(pwd)
echo
echo "1. Administration Guide"
echo "2. Architecture Guide"
echo "3. Deployment Guide"
echo "4. Getting Started Guide"
echo "5. Release Notes"
echo "6. REST API Guide"
echo "7. Technical Notes"
echo "8. Troubleshooting Guide"
echo "9. User Guide" && echo
cd ~/OpenShift/administration-guide
echo -n "1. " && git checkout master
cd ../architecture-guide
echo -n "2. " && git checkout master
cd ../deployment-guide
echo -n "3. " && git checkout master
cd ../getting-started-guide
echo -n "4. " && git checkout master
cd ../release-notes
echo -n "5. " && git checkout master
cd ../rest-api-guide
echo -n "6. " && git checkout master
cd ../tech_notes
echo -n "7. " && git checkout master
cd ../troubleshooting-guide
echo -n "8. " && git checkout master
cd ../user-guide
echo -n "9. " && git checkout master
echo
cd $loc