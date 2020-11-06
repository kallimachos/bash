#!/bin/bash

# Display logs for Kanopy apps

div='======================'

echo
echo $div
echo 'pods'
echo $div
kubectl get pods
echo

echo
echo $div
echo 'kbdash'
echo $div
kubectl logs -l release=kbdash
echo

echo
echo $div
echo 'kbtools'
echo $div
kubectl logs -l release=kbtools
echo