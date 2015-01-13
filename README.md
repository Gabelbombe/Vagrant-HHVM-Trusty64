Vagrant HHVM Installer
======================

To run just do the following.

 - __$ git clone https://github.com/ehime/Vagrant.git && cd $_ __
 - __$ vagrant up__
 - __$ vagrant ssh__

If there are remnant VM's in your space, you might need to destroy
your devices and reload with `vagrant reload --provision` which will
set you up with a new clean env.

Destroy script is called with

 - __$ sudo bash scripts/destroy.sh__

Be careful as this will destroy all Virtualbox machines in the global
scope of your environment. You can check what is lingering in VB with

 - __$ VBoxManage list runningvms__

And also what is lingering in Vagrant with

 - __$ vagrant global-status__

_PLEASE BE AWARE THAT THIS IS A COMPLETE NUKE AND PAVE SCRIPT!!!!_
