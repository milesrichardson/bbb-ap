#!/bin/bash

echo "Warning: Rebooting the beaglebone."
read -p "If sure, [Enter]. To cancel, Ctrl + C"
ssh root@192.168.2.2 'reboot'
