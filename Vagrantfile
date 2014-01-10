# -*- mode: ruby -*-
# vi: set ft=ruby :

DEVSTACK_IP = ENV["DEVSTACK_IP"] || "192.168.50.10"

Vagrant.configure("2") do |config|

  # use official ubuntu 12.04 LTS image
  config.vm.box = "precise"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "devstack"

  # configuration for vmware fusion provider
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end

  # devstack needs more than 1024 MB memory
  config.vm.provider "virtualbox" do |p|
    p.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # forward open stack ui
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # private network setup
  config.vm.network :private_network, ip: DEVSTACK_IP

  # resolve "stdin: is not a tty warning", related issue and proposed fix: https://github.com/mitchellh/vagrant/issues/1673
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # install devstack
  config.vm.provision :shell, :path => "devstack.sh"

end
