#!/bin/sh

# WARNING: DOES NOT CURRENTLY WORK

# run using devstart.sh
# OR
# place this script in /root on the devstack host
# make this script executable with 'chmod 755 devstack.sh'
# run with './devstack.sh'

# create user 'stack' with password 'stack' and add to sudoers file
adduser stack
echo stack | passwd stack --stdin
sed -i 's/# %wheel/%wheel/g' /etc/sudoers
sed -i 's/Defaults \+requiretty//g' /etc/sudoers
usermod -aG wheel stack
#echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# update OS and install git
yum update -qy
yum install -qy git

# make stack owner of /home/stack and clone devstack there
chown stack:stack /home/stack
cd /home/stack
echo "GIT CLONE"
git clone https://git.openstack.org/openstack-dev/devstack

# set required config options
cd devstack
pwd
echo '[[local|localrc]]' > local.conf
echo ADMIN_PASSWORD=password >> local.conf
echo MYSQL_PASSWORD=password >> local.conf
echo RABBIT_PASSWORD=password >> local.conf
echo SERVICE_PASSWORD=password >> local.conf
echo SERVICE_TOKEN=tokentoken >> local.conf

# run stack.sh to install devstack
su stack
./stack.sh