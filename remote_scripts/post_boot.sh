#!/bin/sh -e

ifdown ra0 || true
sh /root/bbb-ap/build/mt7601u/miwifi_work.sh

