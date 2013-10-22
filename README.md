# vagrant devstack

This projects installs [OpenStack Havana](http://www.openstack.org/software/havana/) via [Devstack](http://devstack.org/) on an official Ubuntu 12.04 LTS image. 

## Requirements

You need the following prerequisites:
 * Virtualbox 4.2
 * Vagrant 1.3.5
 * at least 2GB free memory

## Installation

Run `vagrant up` and get a cup of tee. After a couple of minutes the system is up and you are able to log into Open Stack via `http://10.0.2.15`. Use the following credentials:

    user: 		admin
    password: 	devstack 


After a successful run you should see something like:

```bash
Horizon is now available at http://10.0.2.15/
Keystone is serving at http://10.0.2.15:5000/v2.0/
Examples on using novaclient command line is in exercise.sh
The default users are: admin and demo
The password: 779fa04244a581504b0c
This is your host ip: 10.0.2.15
stack.sh completed in 848 seconds.
```

After you created a new machine, ensure you have created rules for access properly

```bash
# Add tcp/22 and icmp to default security group
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
```

## Recommendations

You should size up the memory of the vm if possible. Edit the `Vagrantfile`

```bash
p.customize ["modifyvm", :id, "--memory", "2048"]
```

## Thanks

Thanks to all contributors of OpenStack and Devstack.

## Authors 

 - Christoph Hartmann