#!/bin/sh

cd $(dirname $0)

apt-get --yes install $(cat gnome-shell-extensions.list)

cp -r dconf/* /etc/dconf/.


dconf update
