#!/bin/bash

# Push main to prod

git checkout prod
git pull
git checkout main
git pull
git push origin main:prod
git checkout prod
git pull
git checkout main
