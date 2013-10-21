#!/bin/sh

# environment variables
OPENSTACK_BRANCH=stable/havana
OPENSTACK_ADM_PASSWORD=devstack

export OPENSTACK_BRANCH=$OPENSTACK_BRANCH
export OPENSTACK_ADM_PASSWORD=$OPENSTACK_ADM_PASSWORD

# update system
export DEBIAN_FRONTEND noninteractive
sudo apt-get update || sudo yum update -y
sudo apt-get install -qqy git || sudo yum install -y git

# determine checkout folder
PWD=$(su vagrant -c "cd && pwd")
DEVSTACK=$PWD/devstack
echo Download devstack into $DEVSTACK

# clone devstack
su vagrant -c "cd && git clone -b $OPENSTACK_BRANCH https://github.com/openstack-dev/devstack.git $DEVSTACK"

# copy localrc settings (source: devstack/samples/localrc)
cp /vagrant/config/localrc $DEVSTACK/localrc
chown vagrant:vagrant $DEVSTACK/localrc

# initialize devstack
su vagrant -c "cd $DEVSTACK && ./stack.sh"