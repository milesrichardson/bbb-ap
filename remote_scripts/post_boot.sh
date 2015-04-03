#!/bin/sh -e

ifdown ra0
sh /root/bbb-ap/build/mt7601u/miwifi_work.sh

/etc/init.d/ipsec start
ipsec auto --up L2TP-PSK

