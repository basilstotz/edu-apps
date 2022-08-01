#!/bin/sh

cd $(dirname $0)

cp ./0028-pwmerge /lib/live/config/.

sed -e"s/PasswordAuthentication no/PasswordAuthentication yes/g" -i /etc/ssh/sshd_config


