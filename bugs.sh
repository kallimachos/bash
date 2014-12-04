#!/bin/bash

declare -A queries=( ["1"]="Brian" ["2"]="Dan" ["3"]="Suyog" ["4"]="Shikha" ["5"]="Marianne" ["6"]="CloudFormsDocs" ["7"]="NEW" ["8"]="ON_QA" ["9"]="Errata")
echo
for item in "${!queries[@]}"; do echo "$item - ${queries["$item"]}"; done
echo
echo -n "Select search: "
read search
#echo -n "Include descriptions? (y/n): "
#read descriptions && echo
descriptions='y'

if [ $descriptions == 'y' ]; then
    bugzilla query --savedsearch="${queries[$search]}" | tee /dev/tty | wc -l && echo
else
    bugzilla query --savedsearch="${queries[$search]}" -i | tee /dev/tty | wc -l && echo
fi