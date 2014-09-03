#!/bin/bash

loc=$(pwd)
output=~/CloudForms/3.1/beta_docs
route=http://documentation-devel.engineering.redhat.com/site/documentation/en-US/CloudForms/3.1-Beta/pdf

wget -O "$output/CloudForms-3.1-Beta_Release_Notes.pdf" $route/Management_Engine_5.3_Beta_Release_Notes/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Release_Notes-en-US.pdf

wget -O "$output/Installing_CloudForms_3.1_Beta_on_Red_Hat_Enterprise_Virtualization.pdf" $route/Installing_CloudForms_3.1_Beta_on_Red_Hat_Enterprise_Virtualization/CloudForms-3.1-Beta-Installing_CloudForms_3.1_Beta_on_Red_Hat_Enterprise_Virtualization-en-US.pdf

wget -O "$output/Installing_CloudForms_3.1_Beta_on_Red_Hat_OpenStack_Platform.pdf" $route/Installing_CloudForms_3.1_Beta_on_Red_Hat_OpenStack_Platform/CloudForms-3.1-Beta-Installing_CloudForms_3.1_Beta_on_Red_Hat_OpenStack_Platform-en-US.pdf

wget -O "$output/Installing_CloudForms_3.1_Beta_on_VMware_vSphere.pdf" $route/Installing_CloudForms_3.1_Beta_on_VMware_vSphere/CloudForms-3.1-Beta-Installing_CloudForms_3.1_Beta_on_VMware_vSphere-en-US.pdf

wget -O "$output/Control_Guide.pdf" $route/Management_Engine_5.3_Beta_Control_Guide/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Control_Guide-en-US.pdf

wget -O "$output/Insight_Guide.pdf" $route/Management_Engine_5.3_Beta_Insight_Guide/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Insight_Guide-en-US.pdf

wget -O "$output/Integration_Services_Guide.pdf" $route/Management_Engine_5.3_Beta_Integration_Services_Guide/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Integration_Services_Guide-en-US.pdf

wget -O "$output/Lifecycle_and_Automation_Guide.pdf" $route/Management_Engine_5.3_Beta_Lifecycle_and_Automation_Guide/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Lifecycle_and_Automation_Guide-en-US.pdf

wget -O "$output/Methods_Available_for_Automation.pdf" $route/Management_Engine_5.3_Beta_Methods_Available_for_Automation/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Methods_Available_for_Automation-en-US.pdf

wget -O "$output/Quick_Start_Guide.pdf" $route/Management_Engine_5.3_Beta_Quick_Start_Guide/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Quick_Start_Guide-en-US.pdf

wget -O "$output/Settings_and_Operations_Guide.pdf" $route/Management_Engine_5.3_Beta_Settings_and_Operations_Guide/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_Settings_and_Operations_Guide-en-US.pdf

wget -O "$output/User_Guide.pdf" $route/Management_Engine_5.3_Beta_User_Guide/CloudForms-3.1-Beta-Management_Engine_5.3_Beta_User_Guide-en-US.pdf

cd $output
tar -cvzf beta_docs.tar.gz *.pdf
cd $loc
