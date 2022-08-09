#!/bin/sh

cd $(dirname $0)

mkdir -p /etc/wireguard
cp wg0.conf /etc/wireguard/wg0.conf

systemctl enable wg-quick@wg0.service

