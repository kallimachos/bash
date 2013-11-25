#!/bin/bash

for dir in ~/csp/cloudforms/*; do (cd "$dir" && csprocessor pull); done
for dir in ~/csp/enterprise/*; do (cd "$dir" && csprocessor pull); done
for dir in ~/csp/online/*; do (cd "$dir" && csprocessor pull); done