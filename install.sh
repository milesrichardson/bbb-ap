#!/bin/bash



echo "Warning: This will delete any work-in-progress."
read -p "If sure, [Enter]. To cancel, Ctrl + C"

ssh root@192.168.2.2 'bash -s' < remote_scripts/genesis.sh

