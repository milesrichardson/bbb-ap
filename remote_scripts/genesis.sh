#!/bin/sh -e


# Update kernel
sh /opt/scripts/tools/update_kernel.sh

# Update and upgrade packages
apt-get -y update
apt-get -y upgrade

# Necessary for building kernel packages
apt-get install -y linux-headers-$(uname-r)
apt-get install -y udhcpd

# Create (and delete if exists) buildroot at ~/bbb-ap
cd ~
rm -rf bbb-ap || true
git clone https://github.com/milesrichardson/bbb-ap
cd bbb-ap

# Load deps into ~/bbb-ap/build
cd build
git clone https://github.com/milesrichardson/mt7601u

# Run update script (with build arg for full update including mt7601u)
cd remote_scripts
./update.sh build
