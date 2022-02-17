#!/bin/bash

# Display logs for Kanopy apps

div='======================'

kubectl config use-context api.staging.corp.mongodb.com
echo -e '\nSTAGING'
echo $div
echo 'pods'
echo $div
kubectl get pods
echo

echo
echo $div
echo 'kbdash'
echo $div
kubectl logs --tail=10 -l release=kbdash
echo

echo
echo $div
echo 'kbtools'
echo $div
kubectl logs --tail=10 -l release=kbtools
echo

kubectl config use-context api.prod.corp.mongodb.com
echo -e '\nPROD'
echo $div
echo 'pods'
echo $div
kubectl get pods
echo

echo
echo $div
echo 'kbdash'
echo $div
kubectl logs --tail=10 -l release=kbdash
echo

echo
echo $div
echo 'kbtools'
echo $div
kubectl logs --tail=10 -l release=kbtools
echo