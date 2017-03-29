#!/bin/bash
#
# Configure block node for OpenStack installation

IP=$1
verbose=$2
debug=$3

if [[ "$debug" = "true" ]]; then
    set -x
fi

bash ~/vxlan.sh
sshpass -p stack ssh-copy-id -i .ssh/id_rsa.pub root@$IP
ssh root@$IP
if [[ "$?" != 0 ]]; then
    echo "ssh key copy failed."
    exit $?
fi

# networking
sed -i 's/IPADDR.*/IPADDR=10.1.11.11/' /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=10.1.11.1" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i 's/IPADDR.*/IPADDR=10.1.12.21/' /etc/sysconfig/network-scripts/ifcfg-eth1
sed -i 's/IPADDR.*/IPADDR=10.1.10.21/' /etc/sysconfig/network-scripts/ifcfg-eth2

echo "#!/bin/bash

modprobe vxlan
ip link add vxlan1 type vxlan id 1 group 239.0.0.1 dev eth2 dstport 4789
ip addr add 10.1.13.21/24 brd 10.1.13.255 dev vxlan1" > ~/vxlan.sh

bash ~/vxlan.sh

# configure DNS and hosts
echo "nameserver 8.8.8.8
nameserver 8.8.4.4" >> /etc/resolv.conf

echo "10.1.11.11  controller
10.1.11.21  compute
10.1.11.31  block" > /etc/hosts

# disable firewalld to prevent access problems by other nodes

systemctl stop firewalld
systemctl disable firewalld

# configure NTP
systemctl stop chronyd.service
sed -i 's/server 0.*/server 10.1.11.1 iburst/' /etc/chrony.conf
sed -i 's/server .\..*//' /etc/chrony.conf
systemctl start chronyd.service

# reboot the node
echo "Rebooting..."
reboot now
sleep 10

# reconnect to the block node
repeat="true"
retries=0

while [[ "$repeat" = "true" ]]; do
    retries+=1
    echo "Try number $retries..."
    ssh block && repeat="false"
sleep 5
done

bash ~/vxlan.sh

# test internet connectivity
ping -c 3 openstack.org
if [[ "$?" != 0 ]]; then
    echo "Internet connection failed."
    exit $?
fi

# test NTP
chronyc sources | grep "\^\* gateway"
if [[ "$?" != 0 ]]; then
    echo "chrony configuration failed.."
    exit $?
fi

# install OpenStack packages and upgrade
yum install centos-release-openstack-ocata python-openstackclient openstack-selinux -y
yum upgrade -y

# reboot the node
echo "Rebooting..."
reboot now
sleep 10

# reconnect to the block node
repeat="true"
retries=0

while [[ "$repeat" = "true" ]]; do
    retries+=1
    echo "Try number $retries..."
    ssh block 'bash -s ~/vxlan.sh' && repeat="false"
sleep 5
done

bash ~/vxlan.sh

exit 0
