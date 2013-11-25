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
echo -n "1. " && git push
cd ../architecture-guide
echo -n "2. " && git push
cd ../deployment-guide
echo -n "3. " && git push
cd ../getting-started-guide
echo -n "4. " && git push
cd ../release-notes
echo -n "5. " && git push
cd ../rest-api-guide
echo -n "6. " && git push
cd ../tech_notes
echo -n "7. " && git push
cd ../troubleshooting-guide
echo -n "8. " && git push
cd ../user-guide
echo -n "9. " && git push
echo
cd $loc