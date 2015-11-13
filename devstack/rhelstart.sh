#!/bin/sh
#
# run using devstart.sh
# OR
# place this script in /root on the devstack host
# make this script executable with 'chmod 755 devstack.sh'
# run with './devstack.sh'
#
# For RHEL 7
#------------------------------------------------------------------------------

# update OS and install git
yum update -q -y
yum install -q -y git

sed -i 's/Defaults \+requiretty//g' /etc/sudoers

# make stack owner of /home/stack and clone devstack there
mkdir /home/stack
cd /home/stack
git clone https://git.openstack.org/openstack-dev/devstack

# set required config options
cd devstack
./tools/create-stack-user.sh

echo '[[local|localrc]]' > local.conf
echo ADMIN_PASSWORD=password >> local.conf
echo MYSQL_PASSWORD=password >> local.conf
echo RABBIT_PASSWORD=password >> local.conf
echo SERVICE_PASSWORD=password >> local.conf
echo SERVICE_TOKEN=tokentoken >> local.conf

# hacks to allow stack user to modify certain files
touch .localrc.auto
chmod 766 .localrc.auto
touch .stackenv
chmod 766 .stackenv
touch .prereqs
chmod 766 .prereqs
touch files/get-pip.py
chmod 766 files/get-pip.py

# run stack.sh to install devstack
chown stack:stack /home/stack
su stack
./stack.sh
