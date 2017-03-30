#!/bin/bash
#
# Configure network-services node for OpenStack installation

IP=$1
verbose=$2
debug=$3

if [[ "$debug" = "true" ]]; then
    set -x
fi

# networking
sed -i 's/IPADDR.*/IPADDR=10.1.11.1/' /etc/sysconfig/network-scripts/ifcfg-eth2
sed -i 's/IPADDR.*/IPADDR=10.1.10.1/' /etc/sysconfig/network-scripts/ifcfg-eth3
echo "#!/bin/bash

modprobe vxlan
ip link add vxlan1 type vxlan id 1 group 239.0.0.1 dev eth3 dstport 4789
ip addr add 10.1.13.1/24 brd 10.1.13.255 dev vxlan1" > ~/vxlan.sh

bash ~/vxlan.sh
#debug

# shorewall
sed -i 's/STARTUP_ENABLED.*/STARTUP_ENABLED=Yes/' /etc/shorewall/shorewall.conf
sed -i 's/IP_FORWARDING.*/IP_FORWARDING=On/' /etc/shorewall/shorewall.conf
echo "?FORMAT 2
###############################################################################
#ZONE           INTERFACE               OPTIONS
ext eth0 routefilter,tcpflags
rax eth1
osm1 eth2
ose1 eth3
os1t vxlan1" > /etc/shorewall/interfaces
#debug

echo "eth0 10.1.11.0/24
eth0 10.1.13.0/24" > /etc/shorewall/masq
#debug

echo "###############################################################################
#SOURCE         DEST            POLICY  LOGLEVEL        LIMIT   CONNLIMIT
\$FW all ACCEPT
ext all REJECT
rax all ACCEPT
osm1 all ACCEPT
ose1 all ACCEPT
os1t all ACCEPT" > /etc/shorewall/policy
#debug

echo "##############################################################################################################################################################
#ACTION         SOURCE          DEST            PROTO   DPORT   SPORT   ORIGDEST        RATE    USER    MARK    CONNLIMIT       TIME    HEADERS SWITCH  HELPER

?SECTION ALL
?SECTION ESTABLISHED
?SECTION RELATED
?SECTION INVALID
?SECTION UNTRACKED
?SECTION NEW
Ping/ACCEPT ext \$FW
SSH/ACCEPT ext \$FW
DNAT ext osm1:10.1.11.11  tcp    www
DNAT ext osm1:10.1.11.11  tcp    6080" > /etc/shorewall/rules
#debug

echo "###############################################################################
#ZONE           TYPE            OPTIONS         IN_OPTIONS      OUT_OPTIONS

fw firewall
ext ipv4
rax ipv4
osm1 ipv4
ose1 ipv4
os1t ipv4" > /etc/shorewall/zones
#debug

# check shorewall configuration and exit on error
shorewall check
if [[ "$?" != 0 ]]; then
    echo "Shorewall config failed."
    exit $?
fi
#debug

# configure shorewall to load on boot then start
systemctl enable shorewall
systemctl start shorewall
#debug

# configure DNS and hosts
echo "nameserver 8.8.8.8
nameserver 8.8.4.4" >> /etc/resolv.conf
#debug

echo "127.0.0.1  localhost localhost.localdomain localhost4 localhost4.localdomain4
::1  localhost localhost.localdomain localhost6 localhost6.localdomain6
$IP  network-services
10.1.11.11  controller
10.1.11.21  compute
10.1.11.31  block" > /etc/hosts
#debug

# test internet connectivity
ping -c 3 openstack.org
if [[ "$?" != 0 ]]; then
    echo "Internet connection failed."
    exit $?
fi
#debug

# configure NTP
systemctl stop chronyd.service
echo "allow 10.1.11.0/24" >> /etc/chrony.conf
systemctl enable chronyd.service
systemctl start chronyd.service
if [[ "$?" != 0 ]]; then
    echo "chrony configuration failed."
    exit $?
fi
#debug

# generate an ssh key
echo -e 'y/n'|ssh-keygen -t rsa -b 2048 -C "ns1" -P "" -f .ssh/id_rsa
#debug

#Reboot the node:
reboot now
exit 0
