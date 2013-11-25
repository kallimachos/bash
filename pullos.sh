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
git checkout master -q
echo -n "1. master:      " && git pull
cd ../architecture-guide
git checkout master -q
echo -n "2. master:      " && git pull
cd ../deployment-guide
git checkout master -q
echo -n "3. master:      " && git pull
cd ../getting-started-guide
git checkout master -q
echo -n "4. master:      " && git pull
git checkout Enterprise -q
echo -n "   Enterprise:  " && git merge origin/Enterprise
git checkout summit -q
echo -n "   Summit:      " && git merge origin/summit
git checkout master -q
cd ../release-notes
git checkout master -q
echo -n "5. master:      " && git pull
git checkout Enterprise -q
echo -n "   Enterprise:  " && git merge origin/Enterprise
git checkout Online -q
echo -n "   Online:      " && git merge origin/Online
git checkout master -q
cd ../rest-api-guide
git checkout master -q
echo -n "6. master:      " && git pull
git checkout Enterprise -q
echo -n "   Enterprise:  " && git merge origin/Enterprise
git checkout summit -q
echo -n "   Summit:      " && git merge origin/summit
git checkout master -q
cd ../tech_notes
git checkout master -q
echo -n "7. master:      " && git pull
cd ../troubleshooting-guide
git checkout master -q
echo -n "8. master:      " && git pull
cd ../user-guide
git checkout master -q
echo -n "9. master:      " && git pull
git checkout Enterprise -q
echo -n "   Enterprise:  " && git merge origin/Enterprise
git checkout summit -q
echo -n "   Summit:      " && git merge origin/summit
git checkout master -q
echo
cd $loc