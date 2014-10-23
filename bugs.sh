#!/bin/bash

declare -A queries=( ["1"]="Brian" ["2"]="Dan" ["3"]="Suyog" ["4"]="Shikha" ["5"]="NEW" ["6"]="Need_Info" ["7"]="ON_QA" ["8"]="Docs 5.3.z" ["9"]="RHCI")
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