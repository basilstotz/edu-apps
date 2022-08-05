#!/bin/sh

mkdir -p /srv/puavo-images
mkdir /images
mount -o bind /srv/puavo-images /images

cp $(pwd)/puavo-pkg-update /usr/sbin/puavo-pkg-update
chmod +x /usr/sbin/puavo-pkg-update





