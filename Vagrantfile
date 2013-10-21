# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "devstack"

  config.vm.provider "virtualbox" do |p|
    p.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :shell, :path => "devstack.sh"

end
