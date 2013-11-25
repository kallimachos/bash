#!/bin/bash

for dir in ~/OpenShift/*; do (cd "$dir" && echo 'THIS IS TEST PULL' && git pull); done
