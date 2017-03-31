#!/bin/bash
#
# Install devstack on Ubuntu

apt-get install -y git
apt-get -y update
useradd -s /bin/bash -d /opt/stack -m stack
tee <<<"stack ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
su - stack
git clone https://git.openstack.org/openstack-dev/devstack
cd devstack

echo "[[local|localrc]]
ADMIN_PASSWORD=stack
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD" > local.conf

./stack.sh
exit 0
