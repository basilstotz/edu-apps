#!/bin/sh

set -e "s/^UID_MIN .*$/UID_MIN 10000/g" -i /etc/login.defs
set -e "s/^GID_MIN .*$/GID_MIN 10000/g" -i /etc/login.defs

