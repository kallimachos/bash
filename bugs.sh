#!/bin/bash

declare -A queries=( ["1"]="myCloudForms" ["2"]="Suyog" ["3"]="Shikha" ["4"]="Need_Info" ["5"]="ON_QA" ["6"]="CloudFormsDocs" ["7"]="Doc Bugs in Errata" ["8"]="Errata 5.2.z" ["9"]="Errata 5.3.0" ["10"]="RHCI")
echo
for item in "${!queries[@]}"; do echo "$item - ${queries["$item"]}"; done
echo
echo -n "Select search: "
read search && echo
bugzilla query --savedsearch="${queries[$search]}" | tee /dev/tty | wc -l && echo