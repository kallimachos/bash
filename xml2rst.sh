#!/bin/bash
# A simple bash script for converting Docbook XML files in a directory to RST
#
# Run this script in the directory containing the XML files to convert.
# If you want to delete the XML files after conversion, remove the 'rm $file'
# line.

loc=$(pwd)/*

for file in $loc; do
    if test -f $file; then
        rstfile="${file%.*}.rst"
        pandoc -f docbook -t rst $file -o $rstfile
        xmlfile="${file##*/}"
        rstfile="${rstfile##*/}"
        echo "$xmlfile --> $rstfile"
        # rm $file
    fi
done

echo "Cleaning up RST..."
sed -i 's/programlisting/\ /g' *.rst                       # Delete programlisting tag
sed -i 's/screen/\ /g' *.rst                               # Delete screen tag
sed -i 's/literal/\ /g' *.rst                              # Delete litral tag
sed -i 's/\*\*Note\*\*/\.\.\ note\:\: /g' *.rst            # Fix note directive
sed -i 's/\*\*Tip\*\*/\.\.\ tip\:\: /g' *.rst              # Fix tip directive
sed -i 's/\*\*Warning\*\*/\.\.\ warning\:\: /g' *.rst      # Fix warning directive
sed -i 's/\*\*Important\*\*/\.\.\ important\:\: /g' *.rst  # Fix important directive
echo "Done"
