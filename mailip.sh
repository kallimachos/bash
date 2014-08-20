#!/bin/bash

ip=$(ifconfig eth0 | grep "inet addr")
ip=${ip#*addr:}
ip=${ip/Bcast*}
echo $ip | mail -s "IP Address" bmoss@redhat.com
echo $ip 'mailed to bmoss@redhat.com'