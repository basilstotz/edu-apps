#!/bin/sh

dir="/root/.puavo/gnupg/$(puavo-conf puavo.image.servers)"

mkdir -p $dir

cp -r $(pwd)/pkg $dir/.

