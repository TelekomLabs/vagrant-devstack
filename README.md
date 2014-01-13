# vagrant devstack

This projects installs [OpenStack Havana](http://www.openstack.org/software/havana/) via [Devstack](http://devstack.org/) on an official Ubuntu 12.04 LTS image. 

## Requirements

You need the following prerequisites:
 * Virtualbox 4.2 or VMware Fusion >5.04
 * Vagrant 1.3.5 (with VMware provider)
 * at least 2GB free memory

## Installation

Run `vagrant up` (for VMware `vagrant up --provider vmware_fusion` ) and get a cup of tee. After a couple of minutes the system is up and you are able to log into Open Stack via `192.168.50.10`. Use the following credentials:

    user: 		admin
    password: 	devstack 


After a successful run you should see something like:

```bash
stack.sh completed in 941 seconds.
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

# License

Company: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.