#!/bin/bash

git checkout v10
git fetch upstream
git merge upstream/v10
git push origin v10
git checkout master
