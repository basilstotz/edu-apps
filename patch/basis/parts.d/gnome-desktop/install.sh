#!/bin/sh

#https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/extensions-enable

# knöpfe: org.gnome.desktop.wm.preferences/button-layout

cd $(dirname $0)

#cp -r ./extensions/* /usr/share/gnome-shell/extensions/.

FIRST=0
EXT="["
for E in ./extensions/*; do

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


mkdir -p /etc/dconf/db/local.d/

cat <<EOF > /dev/null #/etc/dconf/db/local.d/00-enabled-extensions
[org/gnome/shell]
# List all extensions that you want to have enabled for all users
enabled-extensions=${EXT}
EOF


cat <<EOF > /dev/null #/etc/dconf/db/local.d/01-button-layout
[org.gnome.desktop.wm.preferences]
# List all extensions that you want to have enabled for all users
button-layout='menu:minimize,maximize,spacer,close'
EOF

mkdir -p /etc/dconf/db/user.d/


cat <<EOF > /etc/dconf/db/user.d/00-enabled-extensions
[org/gnome/shell]
# List all extensions that you want to have enabled for all users
enabled-extensions=${EXT}
EOF


cat <<EOF > /etc/dconf/db/user.d/01-button-layout
[org.gnome.desktop.wm.preferences]
# List all extensions that you want to have enabled for all users
button-layout='menu:minimize,maximize,spacer,close'
EOF



dconf update



