#!/bin/bash

loc=$(pwd)
book=${loc##*/}
echo $book
files=~/CloudForms/2.1/extra/$book/en-US
echo $files
csp preview --override Revision_History.xml=$files/Revision_History.xml --override Author_Group.xml=$files/Author_Group.xml