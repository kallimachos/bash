# bash

A collection of shell scripts for automating various things.

## backup.sh

Runs rsync to back up system to external HD.

## branchlist.sh

Lists local branches for all repositories.

## bump.sh

Merges upstream into local branch for a Rackspace repository and pushes the result to origin.

## clean.sh

Runs 'git clean -xfd' and 'git remote prune origin' on repositories in listed directories.

## cleanscreen.sh

Removes whitespace between <screen> tags and swaps invalid characters for valid XML codes.

## dev

Preps environment for development

## html2rst.sh

Uses pandoc and sed commands to convert webhelp html output files from a DocBook maven build to RST and copies them to a directory.

## local_git_username.sh

Sets the username for my personal repos to kallimachos.

## mailip.sh

Emails the IP address of the local machine to the given address.

## md2rst.sh

Converts Markdown files in a directory to RST using pandoc.

## mygit.sh

Runs 'git pull' on all my personal git repositories.

## newpy.sh

Initializes a new git repository for a python project.

## repocheck.sh

Print 'git status -s -b' of repos in the listed directories if they have uncommitted changes or if they are not on the master branch.

## room.sh

Opens The_Room.txt if no argument; counts words if arg = wc; else appends string to The_Room.txt.

## rump.sh

Merges upstream develop branch into local develop branch for a repository and pushes the result to origin.

## setup.py

Opens The_Room.txt if no argument; counts words if arg = wc; else appends string to The_Room.txt.

## stable.sh

Merges upstream into local stable branches and pushes the results to origin.

## stage.sh

Previews and brews Docbook XML books using publican and csprocessor

## t.sh

Convenience alias for a designated bash or python script.

## testdate.sh

Echos today's date to date.txt

## tldr.sh

Opens tldr.txt if no argument; else appends string to tldr.

## up.sh

Runs the listed 'git pull' scripts.

## xml2rst.sh

Converts Docbook XML files in a directory to RST using pandoc.
