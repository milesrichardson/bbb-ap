#!/bin/sh -e

cd ~

# Script sent to remote server over SSH to pull down this repo
rm -rf bbb-ap
git clone https://github.com/milesrichardson/bbb-ap
cd bbb-ap

cd build

git clone https://github.com/milesrichardson/mt7601u


