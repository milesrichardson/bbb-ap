#!/bin/sh -e
#
# Copyright Miles Richardson, March 2015
#


cd ~/bbb-ap

# To avoid git errors
make clean

git pull

# Config files
cp configs/etc/udhcpd.conf /etc/udhcpd.conf
cp configs/etc/default/udhcpd /etc/default/udhcpd
cp configs/etc/network/interfaces /etc/network/interfaces
cp configs/etc/rc.local /etc/rc.local

# Deps
cd build
git clone http://github.com/milesrichardson/mt7601u

# mt7601u: Unload modules, build and deploy again
cd mt7601u
./unload.sh
./miwifi_build.sh
./miwifi_work.sh
