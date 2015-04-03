#!/bin/sh -e
#
# Copyright Miles Richardson, March 2015
#
# Update from the buildroot


echo "Updating kernel"
sh /opt/scripts/tools/update_kernel.sh

echo "Updating this repository"
git pull

echo "Removing mt7601u subdirectory"
rm -rf mt7601u/

echo "Cloning into new mt7601u subdirectory"
git clone http://github.com/milesrichardson/mt7601u



