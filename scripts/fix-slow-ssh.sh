#!/bin/bash

vagrantup:~$ sudo wget -c http://download.virtualbox.org/virtualbox/4.3.4/VBoxGuestAdditions_4.3.4.iso -O VBoxGuestAdditions_4.3.4.iso

sudo mount VBoxGuestAdditions_4.3.4.iso -o loop /mnt
cd /mnt
sudo sh VBoxLinuxAdditions.run --nox11

cd
sudo rm *.iso
sudo /etc/init.d/vboxadd setup
sudo update-rc.d vboxadd defaults
sudo update-rc.d vboxadd enable
exit 