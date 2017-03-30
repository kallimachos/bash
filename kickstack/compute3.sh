#!/bin/bash
#
# Configure compute node for OpenStack installation
# Step 3

verbose=$1
debug=$2

if [[ "$debug" = "true" ]]; then
    set -x
fi

# reconnect to the compute node
repeat="true"
retries=0

while [[ "$repeat" = "true" ]]; do
    sleep 5
    let "retries++"
    echo "Try number $retries..."
    ssh -o StrictHostKeyChecking=no compute 'bash -s ~/vxlan.sh' \
                                && repeat="false"
done

exit 0
