#!/bin/sh

sed -e"s/PasswordAuthentication no/PasswordAuthentication yes/g" -i /etc/ssh/sshd_config

exit $?


