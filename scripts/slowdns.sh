#!/bin/bash
# Repairs slow DNS on some devices

# CPR : Jd Daniel :: Ehime-ken
# MOD : 2015-01-12 @ 15:51:07
# VER : Version 1

sudo apt-get install -y expect

cd /tmp
sudo wget -c http://download.virtualbox.org/virtualbox/4.3.4/VBoxGuestAdditions_4.3.4.iso \
  -O VBoxGuestAdditions_4.3.4.iso

sudo mount VBoxGuestAdditions_4.3.4.iso -o loop /mnt

cd /mnt
expect -c '
  log_user 1
  spawn sudo sh VBoxLinuxAdditions.run --nox11
  expect {
    Do you wish:     { send "y\r"; exp_continue }
    default          end
    eof
  }
'   ## doesn't work currently

cd
sudo rm *.iso
sudo /etc/init.d/vboxadd setup
sudo update-rc.d vboxadd defaults
sudo update-rc.d vboxadd enable
exit
