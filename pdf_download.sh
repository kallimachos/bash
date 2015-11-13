#!/bin/bash

loc=$(pwd)

echo -n "Enter CloudForms version: "
read version
echo

#Set the CFME version to the CloudForms version + 2.2
cfme=$(echo $version+2.2 | bc)

#Set the directory to save pdfs to
output=~/Desktop/$version
output+=_docs

#If the output directory does not exist, create it
if test ! -d $output; then mkdir $output; fi
cd $output

#Set the root URL to fetch pdfs from and create an array of book titles
route=http://documentation-devel.engineering.redhat.com/site/documentation/\
    en-US/CloudForms/$version/pdf
books=(
    Management_Engine_${cfme}_Release_Notes
    Installing_CloudForms_on_Red_Hat_Enterprise_Virtualization
    Installing_CloudForms_on_Red_Hat_OpenStack_Platform
    Installing_CloudForms_on_VMware_vSphere
    Management_Engine_${cfme}_Control_Guide
    Management_Engine_${cfme}_Deployment_Planning_Guide
    Management_Engine_${cfme}_Insight_Guide
    Management_Engine_${cfme}_Integration_Services_Guide
    Management_Engine_${cfme}_Lifecycle_and_Automation_Guide
    Management_Engine_${cfme}_Methods_Available_for_Automation
    Management_Engine_${cfme}_NetApp_Storage_Integration_Guide
    Management_Engine_${cfme}_OpenShift_Enterprise_Deployment_Guide
    Management_Engine_${cfme}_Quick_Start_Guide
    Management_Engine_${cfme}_Settings_and_Operations_Guide
    Management_Engine_${cfme}_Technical_Notes
    Management_Engine_${cfme}_User_Guide
    )

#Fetch the pdfs and save them to the output directory
for title in "${books[@]}"; do
    wget -O "$output/$title.pdf" \
    $route/$title/CloudForms-$version-$title-en-US.pdf
    done

#Create a gzip tarball of the pdfs
cd $output
tar -cvzf $version_docs.tar.gz *.pdf

# If it does not exist, create a directory for the docs that need to be
# uploaded to the appliance
appliance=cfme_docs
if test ! -d $appliance; then mkdir $appliance && cd $appliance; fi

#Copy the docs with the required filenames for use on the appliance
cp ../Management_Engine_${cfme}_Control_Guide.pdf cfme_control.pdf
cp ../Management_Engine_${cfme}_Insight_Guide.pdf cfme_insight.pdf
cp ../Management_Engine_${cfme}_Integration_Services_Guide.pdf \
    cfme_integrate.pdf
cp ../Management_Engine_${cfme}_Lifecycle_and_Automation_Guide.pdf \
    cfme_automate.pdf
cp ../Management_Engine_${cfme}_Quick_Start_Guide.pdf cfme_quickstart.pdf
cp ../Management_Engine_${cfme}_Settings_and_Operations_Guide.pdf \
    cfme_settingandops.pdf

#Create a gzip tarball of the appliance docs
tar -cvzf cfme_docs.tar.gz cfme_*.pdf

cd $loc
