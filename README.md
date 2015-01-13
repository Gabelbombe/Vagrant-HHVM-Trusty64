Vagrant HHVM Installer
======================

To run just do the following.

 - $ git clone https://github.com/ehime/Vagrant.git && cd $_
 - $ vagrant up
 - $ vagrant ssh


If there are remnant VM's in your space, you might need to destroy
your devices and reload with `vagrant reload --provision` which will
set you up with a new clean env.

Destroy script is called with

 - $ sudo bash scripts/destroy.sh

Be careful as this will destroy all Virtualbox machines in the global
scope of your environment. You can check what is lingering in VB with

 - $ VBoxManage list runningvms

And also what is lingering in Vagrant with

 - $ vagrant global-status

PLEASE BE AWARE THAT THIS IS A COMPLETE NUKE AND PAVE SCRIPT!!!!  
