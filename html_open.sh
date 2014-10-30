#!/bin/bash

echo -n "Enter CloudForms version: "
read version
echo

#Set the CFME version to the CloudForms version + 2.2
cfme=$(echo $version+2.2 | bc)

#Set the root URL to fetch pdfs from and create an array of book titles
route=http://documentation-devel.engineering.redhat.com/site/documentation/en-US/CloudForms/$version/html-single
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

#Open each book in docs devel
for title in "${books[@]}"; do
    firefox $route/$title/index.html
    done