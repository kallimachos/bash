#!/bin/bash

# Display Kanopy pods

div='======================'
environments=(staging prod)
echo

for environment in ${environments[@]}; do
    kubectl config use-context api."$environment".corp.mongodb.com
    echo $div
    echo "$environment"
    echo $div
    kubectl get pods
    echo
done
