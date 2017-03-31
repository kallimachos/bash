#!/bin/bash
#
# Install devstack on a RAX server running the specified [OS]

HELP="Install devstack on a RAX server running the specified [OS].\n
Usage: devstack [OS]\n
-c|--centos\tCentOS operating system
-u|--ubuntu\tUbuntu operating system
-d|--debug\tRun in debug mode
-h|--help\tDisplay help and exit\n"

debug="false"

getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    echo "I’m sorry, `getopt --test` failed in this environment."
    exit 1
fi

SHORT=cudh
LONG=centos,ubuntu,debug,help

# Temporarily store output to be able to check for errors.
# Activate advanced mode getopt quoting e.g. via “--options”.
# Pass arguments only via  -- "$@"  to separate them correctly.
PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    # e.g. $? == 1
    #  then getopt has complained about wrong arguments to stdout
    exit 2
fi
# use eval with "$PARSED" to properly handle the quoting
eval set -- "$PARSED"

# read options until -- is read
while true; do
    case "$1" in
        -c|--centos)
            os="centos"
            name="centos-devstack"
            image="CentOS 7 (PVHVM)"
            shift
            ;;
        -u|--ubuntu)
            os="ubuntu"
            name="ubuntu-devstack"
            image="Ubuntu 16.04 LTS (Xenial Xerus) (PVHVM)"
            shift
            ;;
        -d|--debug)
            debug="true"
            shift
            ;;
        -h|--help)
            echo -e "$HELP"
            exit 0
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

if [[ "$debug" = "true" ]]; then
    set -x
fi

if [[ "$os" != "" ]]; then
    rack servers instance create --name "$name" --image-name "$image" --flavor-id "general1-8" --keypair "Dell"
else
    echo -e "\nERROR: You must specify an operating system.\n"
    exit 1
fi

if [[ "$os" = "ubuntu" ]]; then
    delay=120
else
    delay=60
fi

echo "Building server..."
for ((i=$delay; i>=0; i--)); do
    sleep 1
    printf "\r $i"
done

IP=$(rack servers instance get --name "$name" | grep "PublicIPv4" | sed 's/PublicIPv4\s*//')
echo -e "\nIP Address: $IP"

ssh -o StrictHostKeyChecking=no root@$IP 'bash -s' < "$os".sh

set +x
exit 0
