#!/bin/sh
 
FOUND=0
CHANGED=0
 
# Find all files
for FILE in `find . -type f`
do
 FOUND=$((FOUND +1))
# Ask if we should change this file
 printf "Change file %s ? " $FILE
 read ANSWER
 ANSWER=`echo $ANSWER | tr "[a-z]" "[A-Z]"`
 while [ "$ANSWER" != "Y" -a "$ANSWER" != "N" ]
 do
  printf "Incorrect answer, please answer Y or N. Change file %s ? " $FILE
  read ANSWER
  ANSWER=`echo $ANSWER | tr "[a-z]" "[A-Z]"`
 done
 
# Change it
 if [ "$ANSWER" = "Y" ]
 then
  CHANGED=$((CHANGED+1))
  sed -i 's/a/swap/g' $FILE
  echo $FILE changed
 else
  echo $FILE not changed
 fi
 
done
 
# Print summary
echo $FOUND files found, $CHANGED files changed
