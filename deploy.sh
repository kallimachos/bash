#!/bin/bash

# Push main to prod

prod
git pull
main
git pull
git push origin main:prod
prod
git pull
main
