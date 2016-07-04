====
bash
====

.. image:: https://travis-ci.org/kallimachos/bash.svg?branch=master
   :target: https://travis-ci.org/kallimachos/bash

A collection of bash scripts for automating various things.


backup.sh
~~~~~~~~~
Runs rsync to back up system to external HD.


branchlist.sh
~~~~~~~~~~~~~
Lists local branches for all repositories.


bump.sh
~~~~~~~

Merges local branch for a Rackspace repository with upstream and pushes
the result to origin.

clean.sh
~~~~~~~~
Runs 'git clean -xfd' and 'git remote prune origin' on listed repositories.


cleanscreen.sh
~~~~~~~~~~~~~~
Removes whitespace between <screen> tags and swaps invalid characters for
valid XML codes.


devstack
~~~~~~~~
Collection of scripts for kickstarting devstack on different operating systems.


echo_test.sh
~~~~~~~~~~~~
Test script. Echos 'Hello. This is the echo_test.sh program.'


global_git_username.sh
~~~~~~~~~~~~~~~~~~~~~~
Prints the configured git user.name for all openstack and rpcdocs repos.


html2rst.sh
~~~~~~~~~~~
Uses pandoc and sed commands to convert webhelp html output files
from a DocBook maven build to RST and copies them to a directory.


local_git_username.sh
~~~~~~~~~~~~~~~~~~~~~
Sets the username for my personal repos to kallimachos.


mailip.sh
~~~~~~~~~
Emails the IP address of the local machine to the given address.


md2rst.sh
~~~~~~~~~
Converts Markdown files in a directory to RST using pandoc.


mygit.sh
~~~~~~~~
Runs 'git pull' on all my personal git repositories.


newpy.sh
~~~~~~~~
Initializes a new git repository for a python project.


packages.sh
~~~~~~~~~~~
Lists package names for CloudForms Management Engine books.


pdf_download.sh
~~~~~~~~~~~~~~~
Downloads all PDF books for CloudForms Management Engine.


publish.sh
~~~~~~~~~~
Assembles and publishes Docbook XML using publican and csprocessor.


rackup.sh
~~~~~~~~~
Merges local master branches for Rackspace repositories with upstream
and pushes the results to origin.


rax.sh
~~~~~~
Opens secure shells (SSH) to the listed IP addresses.


repocheck.sh
~~~~~~~~~~~~
Print 'git status -s -b' of repos in the listed directories if they have
uncommitted changes or if they are not on the master branch.


room.sh
~~~~~~~
Opens The_Room.txt if no argument; counts words if arg = wc; else appends
string to The_Room.txt.


setup.py
~~~~~~~~
Opens The_Room.txt if no argument; counts words if arg = wc; else appends
string to The_Room.txt.

stable.sh
~~~~~~~~~
Merges local stable branches with upstream and pushes the results to origin.


stack.sh
~~~~~~~~
Runs 'git pull' on openstack repos


stage.sh
~~~~~~~~
Previews and brews Docbook XML books using publican and csprocessor


t.sh
~~~~
Convenience alias for a designated bash or python script.


testdate.sh
~~~~~~~~~~~
Echos today's date to date.txt


tldr.sh
~~~~~~~
Opens tldr.txt if no argument; else appends string to tldr.


up.sh
~~~~~
Runs the listed 'git pull' scripts.


ups.sh
~~~~~~
Updates Fedora and pip packages.


xml2rst.sh
~~~~~~~~~~
Converts Docbook XML files in a directory to RST using pandoc.
