#!/bin/sh

# only tested on ubuntu precise
export OS_USER=ubuntu
export OS_HOST_IP="`(hostname  -I | cut -f1 -d' ')`"
export OS_HOST_NAME="`(hostname)`"
echo "DETECTED IP: $OS_HOST_IP"

# add ip to /etc/hosts
cp /etc/hosts /etc/hosts.original
echo -e "$OS_HOST_IP\t$OS_HOST_NAME" >> /etc/hosts

# install wget
apt-get install -y git

# download install script
git clone https://github.com/TelekomLabs/vagrant-devstack.git
cd vagrant-devstack && ./devstack.sh


