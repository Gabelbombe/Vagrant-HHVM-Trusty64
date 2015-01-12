# -*- mode: ruby -*-
# vi: set ft=ruby :
# Ubuntu 14.04 HipHop VM base box

# CPR : Jd Daniel :: Ehime-ken
# MOD : 2015-01-12 @ 15:51:07
# VER : Version 1

VAGRANTFILE_API_VERSION = "2"
VAGRANT_REQUIRED_VERSION = "1.2.0"

PROCS  = 4
MEMORY = 8192

# Requires 1.2.x at least
if ! defined? Vagrant.require_version
  if Gem::Version.new(Vagrant::VERSION) < Gem::Version.new(VAGRANT_REQUIRED_VERSION)
    puts "Vagrant >= " + VAGRANT_REQUIRED_VERSION + " required. Your version is " + Vagrant::VERSION
    exit 1
  end
else
  Vagrant.require_version ">= " + VAGRANT_REQUIRED_VERSION
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = 'hokkaidoken'

  config.vm.network :forwarded_port, guest: 22, host: 2227, id: "ssh", disabled: true
  config.vm.network :forwarded_port, guest: 22, host: 2080, auto_correct: true
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :public_network, bridge: 'en1: Wi-Fi (AirPort)'

  config.vm.provider :virtualbox do |vb, override|
    vb.gui = true ## comment out to shush the VBox startup...

    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--vrde", "on"]

    # Upgrade RAM and Proc specs...
    vb.customize ["modifyvm", :id, "--memory", MEMORY]
    vb.customize ["modifyvm", :id, "--cpus",   PROCS]
  end
  config.vm.provision :shell, path: './scripts/slowdns.sh', keep_color: true
  config.vm.provision :shell, path: './scripts/upstart.sh', keep_color: true
end
