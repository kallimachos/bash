#!/bin/bash
# A simple bash script for converting Docbook XML files in a directory to RST
#
# Run this script in the directory containing the XML files to convert.
# If you want to retain the XML files after conversion, remove the 'rm $file' line.

loc=$(pwd)/*

for file in $loc; do
    if test -f $file; then
        rstfile="${file%.*}.rst"
        pandoc -f docbook -t rst $file -o $rstfile
        xmlfile="${file##*/}"
        rstfile="${rstfile##*/}"
        echo "$xmlfile --> $rstfile"
        rm $file
    fi
done
