#!/bin/bash

declare -A queries=( ["1"]="myCloudForms" ["2"]="Suyog" ["3"]="Shikha" ["4"]="ON_QA" ["5"]="Errata 5.2.z" ["6"]="Errata 5.3.0" ["7"]="CloudFormsDocs" )

echo
for item in "${!queries[@]}"; do echo "$item - ${queries["$item"]}"; done
echo
echo -n "Select search: "
read search && echo
bugzilla query --savedsearch="${queries[$search]}" | tee /dev/tty | wc -l  && echo