#!/bin/bash

echo
loc=$(pwd)
cd ~/OpenShift/administration-guide
echo -e "\e[1;35mAdministration Guide\e[00m"
git status -s && echo
cd ../architecture-guide
echo -e "\e[1;35mArchitecture Guide\e[00m"
git status -s && echo
cd ../deployment-guide
echo -e "\e[1;35mDeployment Guide\e[00m"
git status -s && echo
cd ../getting-started-guide
echo -e "\e[1;35mGetting Started Guide\e[00m"
git status -s && echo
cd ../release-notes
echo -e "\e[1;35mRelease Notes\e[00m"
git status -s && echo
cd ../rest-api-guide
echo -e "\e[1;35mREST API Guide\e[00m"
git status -s && echo
cd ../tech_notes
echo -e "\e[1;35mTechnical Notes\e[00m"
git status -s && echo
cd ../troubleshooting-guide
echo -e "\e[1;35mTroubleshooting Guide\e[00m"
git status -s && echo
cd ../user-guide
echo -e "\e[1;35mUser Guide\e[00m"
git status -s && echo
cd $loc