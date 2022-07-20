#!/bin/sh

#https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/extensions-enable

cd $(dirname $0)

cp -r ./extensions/* /usr/share/gnome-shell/extensions/.

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

cat <<EOF > /etc/dconf/db/local.d/00-extensions
[org/gnome/shell]
# List all extensions that you want to have enabled for all users
enabled-extensions=${EXT}
EOF

dconf update



