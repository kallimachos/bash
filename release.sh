#!/bin/bash

git branch $1
git push origin $1:$1
git branch -d $1