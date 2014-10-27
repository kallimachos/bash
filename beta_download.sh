#!/bin/bash

loc=$(pwd)

#Set the directory to save pdfs to
output=~/Desktop/beta_docs

#If the output directory does not exist, create it
if test ! -d $output; then mkdir $output; fi
cd $output

#Set the root URL to fetch pdfs from and create an array of book titles
route=http://documentation-devel.engineering.redhat.com/site/documentation/en-US/CloudForms/3.1-Beta/pdf
books=(
    Installing_CloudForms_3.1_Beta_on_Red_Hat_Enterprise_Virtualization
    Installing_CloudForms_3.1_Beta_on_Red_Hat_OpenStack_Platform
    Installing_CloudForms_3.1_Beta_on_VMware_vSphere
    Management_Engine_5.3_Beta_Control_Guide
    Management_Engine_5.3_Beta_Insight_Guide
    Management_Engine_5.3_Beta_Integration_Services_Guide
    Management_Engine_5.3_Beta_Lifecycle_and_Automation_Guide
    Management_Engine_5.3_Beta_Methods_Available_for_Automation
    Management_Engine_5.3_Beta_Quick_Start_Guide
    Management_Engine_5.3_Beta_Release_Notes
    Management_Engine_5.3_Beta_Settings_and_Operations_Guide
    Management_Engine_5.3_Beta_User_Guide
    )

#Fetch the pdfs and save them to the output directory
for title in "${books[@]}"; do
    wget -O "$output/$title.pdf" $route/$title/CloudForms-3.1-Beta-$title-en-US.pdf
    done

#Create a gzip tarball of the pdfs
cd $output
tar -cvzf beta_docs.tar.gz *.pdf
echo

#Upload the files to file.bne if required
echo -n "Upload to file.bne? (y/n): "
read answer
echo
if [ $answer == 'y' ]; then
    cd .. && scp -r beta_docs/ bmoss@file.bne.redhat.com:public_html/
fi

cd $loc