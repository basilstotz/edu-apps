#!/bin/sh

#https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/extensions-enable

cd $(dirname $0)

cp ./extensions/* /usr/share/gnome-shell/extensions/.

FIRST=0
EXT="["
for E in /usr/share/gnome-shell/extensions/*; do
    if test $FIRST = 0; then
        EB="$(basename $E)"
	FIRST=1
    else
	EB=",$(basename ${E})"
    fi
    EXT= "${EXT}\'${EB}\'"
done
EXT="${EXT}]"

mkdir -p /etc/dconf/db/local.d/

cat <<EOF > /etc/dconf/db/local.d/00-extensions
[org/gnome/shell]
# List all extensions that you want to have enabled for all users
enabled-extensions=${EXT}
EOF

dconf update



