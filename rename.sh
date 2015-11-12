#!/bin/bash

#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat Red Hat/Red Hat/g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/CloudForms/Red Hat CloudForms/g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat Red Hat/Red Hat/g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms_/CloudForms_/g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms.xml/CloudForms.xml/g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms\//CloudForms\//g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms Management/CloudForms Management/g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat Red Hat/Red Hat/g'
#find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/firstname>Red Hat CloudForms/firstname>CloudForms/g'
#publican build --langs en-US --formats html-single
#firefox tmp/en-US/html-single/index.html
#grep -r 'Red Hat CloudForms' en-US/*

sed -i 's/Red Hat Red Hat/Red Hat/g' *.xml
sed -i 's/CloudForms/Red Hat CloudForms/g' *.xml
sed -i 's/Red Hat Red Hat/Red Hat/g' *.xml
sed -i 's/Red Hat CloudForms_/CloudForms_/g' *.xml
sed -i 's/Red Hat CloudForms.xml/CloudForms.xml/g' *.xml
sed -i 's/Red Hat CloudForms\//CloudForms\//g' *.xml
sed -i 's/Red Hat CloudForms Management/CloudForms Management/g' *.xml
sed -i 's/Red Hat Red Hat/Red Hat/g' *.xml
sed -i 's/firstname>Red Hat CloudForms/firstname>CloudForms/g' *.xml