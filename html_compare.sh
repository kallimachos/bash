#!/bin/bash

loc=$(pwd)
route=http://documentation-devel.engineering.redhat.com/site/documentation/en-US/CloudForms/2.0/html-single
path=~/CloudForms/2.0

firefox $route/Management_Engine_5.1_Control_Guide/index.html
cd $path/Control_Guide && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Insight_Guide/index.html
cd ../Insight_Guide && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Integration_Guide/index.html
cd ../Integration_Guide && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Lifecycle_and_Automation_Guide/index.html
cd ../Lifecycle_and_Automation_Guide && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Methods_Available_for_Automation/index.html
cd ../Methods_Available_for_Automation_Guide && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Quick_Start_Guide/index.html
cd ../Quick_Start_Guide && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Release_Notes/index.html
cd ../Release_Notes && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Settings_and_Operations_Guide/index.html
cd ../Settings_and_Operations_Guide && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

firefox $route/Management_Engine_5.1_Technical_Notes/index.html
cd ../Technical_Notes && publican build --langs en-US --formats html-single && firefox tmp/en-US/html-single/index.html

cd $loc