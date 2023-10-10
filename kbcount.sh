#!/bin/zsh
# Wordcount breakdown of the KB
# Run in /kb/content/article directory

kbdir="/Users/brian.moss/mongodb/kb/content/article"

echo "\nAll articles"
ls $kbdir | wc -l
wc < $kbdir/*.md
echo "\nInternal articles"
grep "visibility: \['Internal'\]" $kbdir/*.md | wc -l
wc < `grep -l "visibility: \['Internal'\]" $kbdir/*.md`
echo "\nPartner articles"
grep "Internal', 'Partner'\]" $kbdir/*.md | wc -l
wc < `grep -l "Internal', 'Partner'\]" $kbdir/*.md`
echo "\nCustomer articles"
grep "'Customer'" $kbdir/*.md | wc -l
wc < `grep -l "'Customer'" $kbdir/*.md`
echo "\nPublic articles"
grep "'Public'" $kbdir/*.md | wc -l
wc < `grep -l "'Public'" $kbdir/*.md`
echo
