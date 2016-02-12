#!/bin/bash

# Uses pandoc and sed commands to convert webhelp html output files
# from a DocBook maven build to RST and copies them to a directory.
#
# Download current html output from the Jenkins build server. For example, get
# the Cloud Big Data output here: http://docs-staging.rackspace.com/jenkins/
# job/com.rackspace.cloud.apidocs---cloud-big-data/ws/

# Run the script from a directory containing the html files.
# In the build output, the directory is
# ../target/docbkx/webhelp/<bookname>/content).
#
# If you prefer, copy the html files to another location. Then, run the script
# from that directory. After converting the files, the script creates an output
# directory (out/), copies the RST files to that direcotry.
# Then, removes all the artifacts from the RST conversion (*.RST-e).
#
#  Instructions:
#
# 1. Copy the script to the folder that contains the webhelp html output files.
# 2. Update the permissions so the script can execute: chmod 755 html2rst.sh
# 3. If you make changes to the script, make sure to source the file after
#    saving: source ./html2rst.sh.


set -u
echo Begin HTML to RST conversion

for i in *.html; do
    # Convert from HTML to RST
    file_name=${i%.*l}.rst
    pandoc -s -t rst $i -o $file_name
    sed -i -e '4,16d' $file_name
    sed -i -e '/+--------------------------+$/,$d' $file_name
    sed -i -e '$d' $file_name
    sed -i -e '$d' $file_name

    # Rename files and fix cross-references (from original DocBook XHTML - RST
    # conversion script).
    #
    # Commenting out this section name because html output references are
    # already resolved.
    # Could run a second script after RST conversion to rename files to
    # lowercase, replace -, and then make same change to all links in
    # cross-references.
    #
    # Rename file to second line of new RST content, but lowercase all
    # non-alphanumeric chars
    # all non-alphanumeric chars renamed to underscores.

    # real_file_name=$(sed 's/[^a-zA-Z0-9\-]/_/g;2q;d' $file_name \
    #                 | awk '{print tolower($0)}').rst

    # mv $file_name $real_file_name

    # Replace all cross-refs to xhtml files to renamed rst files
    # sed -i '' -e "s/\<$i/fixmefixmefixme/g" *.rst
    #
    #  End of removed function  for file rename and cross-ref fixes content.

    sed -i '' -e '/<head>/,/<\/head>/d' *.rst                                        #Remove first title block
    sed -i '' -e '/<head>/,/<\/head>/d' *.rst                                        #Remove header block
    sed -i '' -e '/<div class=\"noscript-message-container\">/,/\`Next/d' *.rst      #Remove headerservice navigation
    sed -i '' -e '/<div id=\"feedbackid\">/,/\:target\:\.\.\/atom.xml/d' *.rst       #Remove footer block
    sed -i '' -e '/raw/d' *.rst                                                      #Delete raw html directives.
    sed -i '' -e '/div/d' *.rst                                                      #Delete divs
    sed -i '' -e '/^$/N;/^\n$/D'  *.rst                                              #Delete extra blank lines
    sed -i '' -e 's/programlisting/\ /' *.rst                                        #Delete programlisting tag
    sed -i '' -e 's/screen/\ /' *.rst                                                #Delete screen tag
    sed -i '' -e 's/literal/\ /' *.rst                                               #Delete litral tag
    sed -i '' -e 's/|\[Note\]|/\.\.\  note\:\: /' *rst                               #Fix note directive
    sed -i '' -e 's/|\[Tip\]|/\.\.\  tip\:\: /' *rst                                 #Fix tip directive
    sed -i '' -e 's/|\[Important\]|/\.\.\ Important\:\: /' *rst                      #Fix Important directive

echo Cleaning up RST.

done

echo Move RST files to the output directory.
echo "To change the directory, update line 66 of this script (html2rst.sh) \
to specify the preferred target directory."

# To copy the output in a different directory, change the path to the target
# directory (./out) to your preferred location.

mkdir out;mv *.rst ./out
rm -rf *.rst*
