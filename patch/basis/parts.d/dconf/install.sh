#!/nin/sh

cd $(dirname $0)

cp -r dconf/* /etc/dconf/.


dconf update
