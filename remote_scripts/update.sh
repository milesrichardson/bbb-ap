#!/bin/sh -e
#
# Copyright Miles Richardson, March 2015
#

cd ~/bbb-ap

# Config files
cp configs/etc/udhcpd.conf /etc/udhcpd.conf
cp configs/etc/default/udhcpd /etc/default/udhcpd
cp configs/etc/network/interfaces /etc/network/interfaces
cp configs/etc/rc.local /etc/rc.local

# Deps
cd build

if [ "$1" == "build" ]; then
    rm -rf mt7601u
    git clone http://github.com/milesrichardson/mt7601u
    sh ~/bbb-ap/build/mt7601u/unload.sh
    sh ~/bbb-ap/build/mt7601u/miwifi_build.sh
fi

# mt7601u: Unload modules, build and deploy again
cd mt7601u
ifdown ra0
sh ~/bbb-ap/build/mt7601u/unload.sh
sh ~/bbb-ap/build/mt7601u/miwifi_work.sh
