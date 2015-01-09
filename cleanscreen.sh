#!/bin/bash

# removes whitespace between <screen> tags and swaps invalid characters for valid XML codes

sed -i ':a;N;$!ba;s/[ \t]*<screen>\n/<screen>/g' $1
sed -i "s/\`/'/g" $1
sed -i 's/C\&U/C\&amp\;U/g' $1
sed -i 's/ \& / and /g' $1
sed -i 's/ \#</ \&lt\;/g' $1