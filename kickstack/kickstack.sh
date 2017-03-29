#!/bin/bash
#
# Configures nodes on RAX for OpenStack installation

HELP="Configure nodes for OpenStack installation.\n
Usage: kickstack [node IPs]\n
-n|--network\tNetwork services node IP address
-c|--controller\tController node management IP address
-p|--compute\tCompute node management IP address
-b|--block\tBlock node management IP address
-v|--verbose\tVerbose mode
-h|--help\tDisplay help and exit\n"

verbose="false"
debug="false"

getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    echo "I’m sorry, `getopt --test` failed in this environment."
    exit 1
fi

SHORT=n:c:p:b:vdh
LONG=network:,controller:,compute:,block:,verbose,debug,help

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
        -n|--network)
            network="$2"
            shift 2
            ;;
        -c|--controller)
            controller="$2"
            shift 2
            ;;
        -p|--compute)
            compute="$2"
            shift 2
            ;;
        -b|--block)
            block="$2"
            shift 2
            ;;
        -v|--verbose)
            verbose="true"
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

if [[ "$verbose" = "true" ]]; then
    echo -e "\nnetwork = ${network}"
    echo controller = "${controller}"
    echo compute = "${compute}"
    echo block = "${block}"
    echo verbose = "${verbose}"
    echo -e debug = "${debug}\n"
fi

ssh root@$network 'bash -s' < network.sh $network $verbose $debug

repeat="true"
retries=0

while [[ "$repeat" = "true" ]]; do
    retries+=1
    echo "Try number $retries..."
    ssh root@$network 'bash -s' < controller.sh $controller $verbose $debug && repeat="false"
sleep 5
done

ssh root@$network 'bash -s' < compute.sh $compute $verbose $debug
ssh root@$network 'bash -s' < block.sh $block $verbose $debug

set +x
exit 0
