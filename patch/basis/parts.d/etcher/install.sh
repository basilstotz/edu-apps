#!/bin/sh

cd $(dirname $0)

wget https://github.com/balena-io/etcher/releases/download/v1.7.9/balena-etcher-electron_1.7.9_amd64.deb


dpkg -i balena-etcher-electron_1.7.9_amd64.deb


rm balena-etcher-electron_1.7.9_amd64.deb
