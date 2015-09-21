#!/bin/bash
#
# Runs the appropriate OS $script on the destination $IP machine

IP=$2
ERROR="Usage: devstack [OS] <IP Address>"
HELP="$ERROR\n
Install devstack on the server at <IP Address> running the specified [OS].\n\n
IP Address\tIP address of target server\n
-f|--fed\tFedora operating system\n
-r|--rhel\tRHEL operating system\n
-u|--ubu\tUbuntu operating system\n
-h|--help\tDisplay help and exit\n"

# read the options
TEMP=`getopt -o fruh --long fed,rhel,ub,help -n 'devstack.sh' -- "$@"`
eval set -- "$TEMP"

# Set script based on provided option
while true ; do
    case "$1" in
        -f|--fed) script=fedstart.sh ; break ;;
        -r|--rhel) script=rhelstart.sh ; break ;;
        -u|--ubu) script=ubstart.sh ; break ;;
        -h|--help) echo -e $HELP ; exit 0 ;;
        *) echo -e "$ERROR\n" ; exit 1 ;;
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
    echo -e "$ERROR\n" ; exit 1
fi