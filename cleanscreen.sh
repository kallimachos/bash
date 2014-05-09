#!/bin/bash

sed -i ':a;N;$!ba;s/[ \t]*<screen>\n/<screen>/g' $1