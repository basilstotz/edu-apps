#!/bin/sh

echo "de_CH.UTF-8 UTF-8" >> /etc/locale.gen
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
echo "es_PE.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

