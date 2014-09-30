#!/bin/bash

loc=~/CloudForms/2.0

for dir in $loc/*; do (cd "$dir" && rhpkg publican-build --lang en-US -m "Stage on docs-devel"); done