#!/bin/bash

# Emails the IP address of the local machine to the given address.

ip=$(ifconfig eth0 | grep "inet addr")
ip=${ip#*addr:}
ip=${ip/Bcast*}
echo $ip | mail -s "IP Address" example@email.com
echo $ip 'mailed to example@email.com'
