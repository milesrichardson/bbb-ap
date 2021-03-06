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
    rm -rf mt7601u || true
    git clone http://github.com/milesrichardson/mt7601u
    cd mt7601u

    ./unload.sh || true
    ./miwifi_build.sh
else
    cd mt7601u
    git pull
fi

ifdown ra0 || true
./unload.sh || true
./miwifi_work.sh
