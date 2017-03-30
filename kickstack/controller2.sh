#!/bin/bash
#
# Configure controller node for OpenStack installation
# Step 2

verbose=$1
debug=$2

if [[ "$debug" = "true" ]]; then
    set -x
fi

# reconnect to the controller node
repeat="true"
retries=0

while [[ "$repeat" = "true" ]]; do
    sleep 5
    let "retries++"
    echo "Try number $retries..."
    ssh -o StrictHostKeyChecking=no controller && repeat="false"
done

bash ~/vxlan.sh

# test internet connectivity
ping -c 3 openstack.org
if [[ "$?" != 0 ]]; then
    echo "Internet connection failed."
    exit $?
fi
#debug

# test NTP
chronyc sources | grep "\^\* gateway"
if [[ "$?" != 0 ]]; then
    echo "chrony configuration failed.."
    exit $?
fi
#debug

# install OpenStack packages and upgrade
yum install centos-release-openstack-ocata python-openstackclient \
    openstack-selinux -y
yum upgrade -y
#debug

# reboot the node
echo "Rebooting..."
reboot now
exit 0