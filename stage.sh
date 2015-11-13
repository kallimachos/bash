#!/bin/bash

echo -n "Enter CloudForms version: "
read version

loc=~/csp/cloudforms/$version
rel=$loc/Release_Notes
tech=$loc/Technical_Notes

function packagelist {
    package=$(publican package --lang en-US | tail --lines=1)
    package=${package#*rpm/} && package=${package/.src*/eng}
    echo $package && echo $package >> $loc/packages.txt
}

#function runtab {
#
# This works, but running that many operations at once slowed
# things to a crawl.
#
#    tab="--tab-with-profile=Default"
#    cmd="bash -c '$1';bash"
#    foo=""
#
#    for dir in $loc/*; do
#        foo+=($tab -e "$cmd")
#    done
#
#    gnome-terminal "${foo[@]}"
#}

echo -n "View packages (y/n): "
read packages
test -e $loc/packages.txt && rm $loc/packages.txt

if [ "$packages" == "y" ]; then
    echo "Building packages..."
    for dir in $loc/*; do
        cd "$dir"/assembly/publican
        packagelist
    done
else echo "Skipping packages" && echo
fi

echo -n "Preview (a)ll, (r)el and tech notes, (e)verthing except rel and tech \
    notes, (s)kip: "
read books

if [ "$books" == "a" ]; then
    for dir in $loc/*; do
        (cd "$dir" && csprocessor preview --hide-output);
    done


elif [ "$books" == "r" ]; then
    cd $rel && csprocessor preview --hide-output
    cd $tech && csprocessor preview --hide-output
elif [ "$books" == "s" ]; then
    echo "Skipping preview" && echo
else
    for dir in $loc/*; do
        if [ "$dir" != $rel -a "$dir" != $tech ] ; then
            cd "$dir" && csprocessor preview --hide-output
        fi
    done
fi

echo -n "Brew (a)ll, (r)el and tech notes, (e)verthing except rel and \
    tech notes, (c)ancel: "
read books

# add logic to stop watching brew tasks after getting "Watching tasks
# (this may be safely interrupted)..." message.

if [ "$books" == "a" ]; then
    for dir in $loc/*; do
        (cd "$dir" && csprocessor publish);
    done
elif [ "$books" == "r" ]; then
    cd $rel && csprocessor publish
    cd $tech && csprocessor publish
elif [ "$books" == "e" ]; then
    for dir in $loc/*; do
        if [ "$dir" != $rel -a "$dir" != $tech ] ; then
            cd "$dir" && csprocessor publish
        fi
    done
    else
        echo -e "Exiting on user command.\n"
        exit 1
fi
