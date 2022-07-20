#!/bin/sh

FIRST=0
EXT="["
for E in /usr/share/gnome-shell/extensions/*; do

    EB="$(basename $E)"

    if test $FIRST = 0; then
        FIRST=1
	EI="'$EB'"
    else
        EI=",'$EB'"
    fi
    EXT="${EXT}${EI}"
done
EXT="${EXT}]"

echo $EXT
