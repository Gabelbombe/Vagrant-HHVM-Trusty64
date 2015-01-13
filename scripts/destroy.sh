#!/bin/bash
# Destroys all Virtualbox environments (semi-gracefully....)

# CPR : Jd Daniel :: Ehime-ken
# MOD : 2015-01-12 @ 17:15:15
# VER : Version 1

VBoxManage list runningvms |awk '{print $2;}' |xargs -I vmid VBoxManage controlvm vmid savestate
VBoxManage list runningvms |awk '{print $2;}' |xargs -I vmid VBoxManage controlvm vmid poweroff

vagrant global-status --prune

## continually destroys applicances until carriage...
echo "==> Nuking the following boxes..."

vagrant global-status; sleep 3

while read appliance; do
  [ ! -z "$appliance" ] && {
    vagrant destroy --force $(echo $appliance |awk '{print$1}')
  } || {
    break
  }
done < <(vagrant global-status |tail -n +3)
