#!/bin/bash

# Display logs for Kanopy apps

div='======================'
repos=(kb kbdash kbhub kbsearch kbtools)

kubectl config use-context api.staging.corp.mongodb.com
echo -e '\nSTAGING'

for item in ${repos[@]}; do
    echo
    echo $div
    echo $item
    echo $div
    kubectl logs --tail=10 -l release="$item"
    echo
done

kubectl config use-context api.prod.corp.mongodb.com
echo -e '\nPROD'

for item in ${repos[@]}; do
    echo
    echo $div
    echo $item
    echo $div
    kubectl logs --tail=5 -l release="$item"
    echo
done
