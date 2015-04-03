#!/bin/sh -e


# Update kernel
sh /opt/scripts/tools/update_kernel.sh

# Create (and delete if exists) buildroot at ~/bbb-ap
cd ~
rm -rf bbb-ap
git clone https://github.com/milesrichardson/bbb-ap
cd bbb-ap

# Load deps into ~/bbb-ap/build
cd build
git clone https://github.com/milesrichardson/mt7601u
