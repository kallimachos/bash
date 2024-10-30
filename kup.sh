#!/bin/bash

# Refresh kubectl credentials

div='======================'
envs=(staging prod)

echo
echo $div
echo 'kubectl'
echo $div

for env in ${envs[@]}; do
    kubectl config use-context api.$env.corp.mongodb.com && kubectl get deployments
    echo
done
