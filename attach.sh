#!/bin/bash

# Attach to SSH session into beaglebone buildroot

echo "Attaching to root@192.168.2.2:~/build"
read -p "Press [Enter] to attach or Ctrl-C to cancel."

ssh -t root@192.168.2.2 "cd ~/build ; bash"
