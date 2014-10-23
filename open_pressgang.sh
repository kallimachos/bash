#!/bin/bash

route=http://docbuilder.usersys.redhat.com

echo -n "Enter CloudForms version: "
read version
echo

if [ $version == 'beta' ]; then
    firefox $route/22842/
fi

if [ $version == '3.1' ]; then
    firefox $route/22746/
    firefox $route/22747/
    firefox $route/22748/
    firefox $route/22842/
    firefox $route/22843/
    firefox $route/22682/
    firefox $route/22845/
    firefox $route/22846/
    firefox $route/22886/
    firefox $route/22847/
    firefox $route/22848/
    firefox $route/22849/
    firefox $route/22850/
    firefox $route/22851/
    firefox $route/22955/
fi

if [ $version == '3.0' ]; then
    firefox $route/22842/
fi