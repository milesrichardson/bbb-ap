#!/bin/bash

# Update and build drivers

# Create buildroot on beaglebone and update kernel
echo "Warning: Will update repo and rebuild drivers"
read -p "If sure, [Enter]. To cancel, Ctrl + C"

ssh root@192.168.2.2 'bash -s' < remote_scripts/clean.sh
ssh root@192.168.2.2 'bash -s' < remote_scripts/update.sh build
echo "Done"

# Optionally attach to a new SSH session
read -p "Press [Enter] to attach or Ctrl-C to cancel."
echo "attaching to root@192.168.2.2:~/bbb-ap"
ssh -t root@192.168.2.2 "cd ~/bbb-ap ; bash"
