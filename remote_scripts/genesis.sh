#!/bin/sh -e

# Script sent to remote server over SSH to pull down this repo
rm -rf ~/build
mkdir ~/build
cd ~/build

git clone https://github.com/milesrichardson/bbb-ap .
cd bbb-ap/build

# Deps

git clone https://github.com/milesrichardson/mt7601u
