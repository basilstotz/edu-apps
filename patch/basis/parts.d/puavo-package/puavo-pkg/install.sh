#!/bin/sh

if ! getent passwd | grep -q puavo-pkg; then
     useradd  --home-dir /tmp/puavo-pkg-home --create-home --system  puavo-pkg
fi

mkdir -p /etc/puavo
cat <<'EOF' > /etc/puavo/puavo-pkg.conf
### This file is sourced by puavo-pkg Bash script. It must not contain
### anything else than the variable definitions described below.
### The variables are also read by a ruby-script, so do not change the format.

### Uncomment to change the default cache directory.
#PUAVO_PKG_CACHEDIR=/var/cache/puavo-pkg

### Uncomment to change the default root directory for the package tree.
#PUAVO_PKG_ROOTDIR=/var/lib/puavo-pkg
EOF

cat <<EOF > /etc/puavo/topdomain
opinsys.fi
EOF

cp $(pwd)/puavo-pkg /usr/sbin/puavo-pkg
chmod +x /usr/sbin/puavo-pkg



