#!/bin/sh

# update system
export DEBIAN_FRONTEND noninteractive
sudo apt-get update || sudo yum update -y
sudo apt-get install -qqy git || sudo yum install -y git

# determine checkout folder
PWD=$(su vagrant -c "cd && pwd")
DEVSTACK=$PWD/devstack
echo Download devstack into $DEVSTACK

# clone devstack
BRANCH=stable/havana
su vagrant -c "cd && git clone -b $BRANCH https://github.com/openstack-dev/devstack.git $DEVSTACK"

cp /vagrant/config/localrc $DEVSTACK/localrc
chown vagrant:vagrant $DEVSTACK/localrc