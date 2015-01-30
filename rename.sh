#!/bin/bash

find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat Red Hat/Red Hat/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/CloudForms/Red Hat CloudForms/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat Red Hat/Red Hat/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms_/CloudForms_/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms.xml/CloudForms.xml/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms\//CloudForms\//g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms1/CloudForms1/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms2/CloudForms2/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms3/CloudForms3/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms4/CloudForms4/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms5/CloudForms5/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms6/CloudForms6/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms7/CloudForms7/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat CloudForms Management/CloudForms Management/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/Red Hat Red Hat/Red Hat/g'
find en-US/ -type f -name "*.xml" -print0 | xargs -0 sed -i 's/firstname>Red Hat CloudForms/firstname>CloudForms/g'
publican build --langs en-US --formats html-single
firefox tmp/en-US/html-single/index.html
#grep -r 'Red Hat CloudForms' en-US/*