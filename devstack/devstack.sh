#!/bin/bash
#
# Runs the appropriate OS $script on the destination $IP machine

IP=$2

# read the options
TEMP=`getopt -o fru --long fed,rhel,ub -n 'devstack.sh' -- "$@"`
eval set -- "$TEMP"

# Set script based on provided option
while true ; do
    case "$1" in
        -f|--fed) script=fedstart.sh ; break ;;
        -r|--rhel) script=rhelstart.sh ; break ;;
        -u|--ubu) script=ubstart.sh ; break ;;
        *) echo "Error: Enter a destination operating system." ; exit 1 ;;
    esac
done

if [ "$IP" != "" ]; then
    echo "Running $script on $IP"
    for i in `seq 1 20`;
        do
            echo -n "."
            sleep 0.1
        done
    echo "." ; sleep 0.1
    script=~/scripts/bash/devstack/$script
    ssh root@$IP 'bash' < $script
else
    echo "Error: Enter a destination IP address." ; exit 1
fi