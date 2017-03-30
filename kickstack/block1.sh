#!/bin/bash
#
# Configure block node for OpenStack installation
# Step 1

IP=$1
verbose=$2
debug=$3

if [[ "$debug" = "true" ]]; then
    set -x
fi

sshpass -p 'stack' ssh-copy-id -i .ssh/id_rsa.pub -o StrictHostKeyChecking=no \
                                                                    root@$IP
ssh -o StrictHostKeyChecking=no root@$IP
if [[ "$?" != 0 ]]; then
    echo "ssh key copy failed."
    exit $?
fi
#debug

# networking
sed -i 's/IPADD.*/IPADDR=10.1.11.31/' /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=10.1.11.1" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i 's/IPADD.*/IPADDR=10.1.12.41/' /etc/sysconfig/network-scripts/ifcfg-eth1
#debug

# configure DNS and hosts
echo "nameserver 8.8.8.8
nameserver 8.8.4.4" >> /etc/resolv.conf

echo "10.1.11.11  controller
10.1.11.21  compute
10.1.11.31  block" > /etc/hosts
#debug

# disable firewalld to prevent access problems by other nodes
systemctl stop firewalld
systemctl disable firewalld
#debug

# configure NTP
systemctl stop chronyd.service
sed -i 's/server 0.*/server 10.1.11.1 iburst/' /etc/chrony.conf
sed -i 's/server .\..*//' /etc/chrony.conf
systemctl start chronyd.service
#debug

# reboot the node
echo "Rebooting..."
reboot now
exit 0
