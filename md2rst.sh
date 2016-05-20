#!/bin/bash
# Converts Markdown files in a directory to RST using pandoc.
#
# Run this script in the directory containing the Markdown files to convert.
# If you want to delete the Markdown files after conversion, remove the
# 'rm $file' line.

loc=$(pwd)/*

for file in $loc; do
    if [[ $file == *.md ]]; then
        rstfile="${file%.*}.rst"
        pandoc -f markdown -t rst $file -o $rstfile
        xmlfile="${file##*/}"
        rstfile="${rstfile##*/}"
        echo "$xmlfile --> $rstfile"
        # rm $file
    fi
done

echo "Cleaning up RST..."
# Add auto-cleaning statements as required.
sed -i 's/\*\*NOTE\*\*\:/\.\. note\:\: /g' *.rst            # Fix note directive
sed -i 's/\*\*TIP\*\*\:/\.\. tip\:\: /g' *.rst              # Fix tip directive
sed -i 's/\*\*WARNING\*\*\:/\.\. warning\:\: /g' *.rst      # Fix warning directive
sed -i 's/\*\*IMPORTANT\*\*\:/\.\. important\:\: /g' *.rst  # Fix important directive
echo "Done"
