#!/bin/sh

cat <<EOF >/etc/apt/sources.list
# See https://wiki.debian.org/SourcesList for more information.

deb http://deb.debian.org/debian bookworm main contrib non-free-firmware
deb-src http://deb.debian.org/debian bookworm main contrib non-free-firmware

#deb http://deb.debian.org/debian bookworm-updates main contrib non-free-firmware
#deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free-firmware

deb http://security.debian.org/debian-security/ bookworm-security main contrib non-free-firmware
deb-src http://security.debian.org/debian-security/ bookworm-security main contrib non-free-firmware

#deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware
#deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware

deb [trusted=yes]  http://www.amxa.ch/reprepro bookworm main

EOF

apt update

apt --yes upgrade

apt --yes autoremove

