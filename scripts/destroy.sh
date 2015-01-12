#!/bin/bash

VBoxManage list runningvms | awk '{print $2;}' | xargs -I vmid VBoxManage controlvm vmid savestate
VBoxManage list runningvms | awk '{print $2;}' | xargs -I vmid VBoxManage controlvm vmid poweroff
vagrant global-status --prune
