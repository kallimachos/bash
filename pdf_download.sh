#!/bin/bash

loc=$(pwd)

echo -n "Enter CloudForms version: "
read version
echo

output=~/Desktop/$version

if test -d $output; then
    cd $output
else
    mkdir $output
    cd $output
fi

if [ $version == 'beta' ]; then
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
fi

if [ $version == '3.1' ]; then
    route=http://documentation-devel.engineering.redhat.com/site/documentation/en-US/CloudForms/3.1/pdf

    echo -n "Include Rel and Tech Notes? (y/n): "
    read notes
    echo

    if [ $notes == 'y' ]; then
        wget -O "$output/CloudForms-3.1-Release_Notes.pdf" $route/Management_Engine_5.3_Release_Notes/CloudForms-3.1-Management_Engine_5.3_Release_Notes-en-US.pdf
        wget -O "$output/CloudForms-3.1-Technical_Notes.pdf" $route/Management_Engine_5.3_Technical_Notes/CloudForms-3.1-Management_Engine_5.3_Technical_Notes-en-US.pdf
    fi

    wget -O "$output/Installing_CloudForms_on_Red_Hat_Enterprise_Virtualization.pdf" $route/Installing_CloudForms_on_Red_Hat_Enterprise_Virtualization/CloudForms-3.1-Installing_CloudForms_on_Red_Hat_Enterprise_Virtualization-en-US.pdf
    wget -O "$output/Installing_CloudForms_on_Red_Hat_OpenStack_Platform.pdf" $route/Installing_CloudForms_on_Red_Hat_OpenStack_Platform/CloudForms-3.1-Installing_CloudForms_on_Red_Hat_OpenStack_Platform-en-US.pdf
    wget -O "$output/Installing_CloudForms_on_VMware_vSphere.pdf" $route/Installing_CloudForms_on_VMware_vSphere/CloudForms-3.1-Installing_CloudForms_on_VMware_vSphere-en-US.pdf
    wget -O "$output/Control_Guide.pdf" $route/Management_Engine_5.3_Control_Guide/CloudForms-3.1-Management_Engine_5.3_Control_Guide-en-US.pdf
    wget -O "$output/Insight_Guide.pdf" $route/Management_Engine_5.3_Insight_Guide/CloudForms-3.1-Management_Engine_5.3_Insight_Guide-en-US.pdf
    wget -O "$output/Integration_Services_Guide.pdf" $route/Management_Engine_5.3_Integration_Services_Guide/CloudForms-3.1-Management_Engine_5.3_Integration_Services_Guide-en-US.pdf
    wget -O "$output/Lifecycle_and_Automation_Guide.pdf" $route/Management_Engine_5.3_Lifecycle_and_Automation_Guide/CloudForms-3.1-Management_Engine_5.3_Lifecycle_and_Automation_Guide-en-US.pdf
    wget -O "$output/Methods_Available_for_Automation.pdf" $route/Management_Engine_5.3_Methods_Available_for_Automation/CloudForms-3.1-Management_Engine_5.3_Methods_Available_for_Automation-en-US.pdf
    wget -O "$output/NetApp_Integration_Guide.pdf" $route/Management_Engine_5.3_NetApp_Storage_Integration_Guide/CloudForms-3.1-Management_Engine_5.3_NetApp_Storage_Integration_Guide-en-US.pdf
    wget -O "$output/Quick_Start_Guide.pdf" $route/Management_Engine_5.3_Quick_Start_Guide/CloudForms-3.1-Management_Engine_5.3_Quick_Start_Guide-en-US.pdf
    wget -O "$output/Settings_and_Operations_Guide.pdf" $route/Management_Engine_5.3_Settings_and_Operations_Guide/CloudForms-3.1-Management_Engine_5.3_Settings_and_Operations_Guide-en-US.pdf
    wget -O "$output/User_Guide.pdf" $route/Management_Engine_5.3_User_Guide/CloudForms-3.1-Management_Engine_5.3_User_Guide-en-US.pdf
    cd $output
    tar -cvzf 3.1_docs.tar.gz *.pdf
    cp Control_Guide.pdf cfme_control.pdf
    cp Insight_Guide.pdf cfme_insight.pdf
    cp Integration_Services_Guide.pdf cfme_integrate.pdf
    cp Lifecycle_and_Automation_Guide.pdf cfme_automate.pdf
    cp Quick_Start_Guide.pdf cfme_quickstart.pdf
    cp Settings_and_Operations_Guide.pdf cfme_settingandops.pdf
fi

cd $loc
