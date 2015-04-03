#!/bin/sh -e
#
# Copyright Miles Richardson, March 2015
#

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
sh ~/bbb-ap/build/mt7601u/unload.sh

if [ "$1" == "build" ]; then
    sh ~/bbb-ap/build/mt7601u/miwifi_build.sh
fi

sh ~/bbb-ap/build/mt7601u/miwifi_work.sh
