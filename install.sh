#!/bin/sh

git pull origin
make
sh chroot-script.sh
apt autoremove
apt clean

