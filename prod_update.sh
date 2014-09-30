#!/bin/bash

loc=$(pwd)

#declare -A versions=( ["1"]="3.0" ["2"]="beta" ["3"]="3.1")
#
#for item in "${!versions[@]}"; do
#    directory=${versions["$item"]}
    directory=3.1
    #echo "Updating $directory..."
    #for dir in ~/csp/cloudforms/$directory/*; do
    #    cd "$dir" # && csprocessor pull
    #    #sed -i '0,/Product = CloudForms/s/Product = CloudForms/Product = Red Hat CloudForms/' *.contentspec
    #    #sed -i 's/Product = Red Hat CloudForms/Product = CloudForms/g' *.contentspec
    #    #head -n 20 *.contentspec
    #    #csprocessor push
    #done

    #echo "Checking $directory..."
    #for dir in ~/csp/cloudforms/3.0/*; do
    #    cd "$dir"
    #    grep -H "BZProduct = Red Hat CloudForms" *.contentspec
    #done
    #
    echo "Assembling $directory..."
    for dir in ~/csp/cloudforms/$directory/*; do
        cd "$dir" && csprocessor assemble
    done
#done

cd $loc