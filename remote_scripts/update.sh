#!/bin/sh -e
#
# Copyright Miles Richardson, March 2015
#


cd ~/bbb-ap

# To avoid git errors
make clean

git pull

# Deps
cd build
git clone http://github.com/milesrichardson/mt7601u
