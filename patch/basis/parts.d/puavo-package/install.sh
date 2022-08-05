#!/bin/sh

cd $(dirname $0)

for p in *; do
    ./$p/install.sh
done
