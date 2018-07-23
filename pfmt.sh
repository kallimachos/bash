#!/bin/bash

# Format python files according to style.yapf
# Use black to normalize quotation marks

for file in *.py; do
    [ -f "$file" ] || break
    black $file
    yapf --in-place $file
done
