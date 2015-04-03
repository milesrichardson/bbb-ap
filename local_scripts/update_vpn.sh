#!/bin/bash

echo "Warning: This will delete any work-in-progress."
read -p "If sure, [Enter]. To cancel, Ctrl + C"

ssh root@192.168.2.2 'bash -s' < remote_scripts/clean.sh
ssh root@192.168.2.2 'bash -s' < remote_scripts/update_vpn.sh
echo "Done"

# Optionally attach to a new SSH session
read -p "Press [Enter] to attach or Ctrl-C to cancel."
echo "attaching to root@192.168.2.2:~/bbb-ap"
ssh -t root@192.168.2.2 "cd ~/bbb-ap ; bash"
