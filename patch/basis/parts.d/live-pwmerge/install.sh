#!/bin/sh

# depends on /usr/share/ltsp/client/login/pwmerge in package ltsp !

cat <<EOF > /lib/live/config/0028-pwmerge
#!/bin/sh
#set -e

Init (){
    test -x /usr/share/ltsp/client/login/pwmerge || exit 0
}

Config (){
    if test -f /home/.login/passwd; then
        TMP=$(mktemp -d)
    	/usr/share/ltsp/client/login/pwmerge /home/.login /etc/ $TMP/
    	cp -a $TMP/* /etc/
    	rm -r $TMP


	#prevent running these ...
	touch /var/lib/live/config/live-debconfig_passwd
        touch /var/lib/live/config/user-setup
	touch /var/lib/live/config/sudo
    fi
}

Init
Config
EOF
chmod +x /lib/live/config/0028-pwmerge

cat <<'EOF' > /usr/local/bin/passwords-save
#!/bin/bash
if test -z "$1";then
   echo "usage: passwords-save <destdir>
   exit 1
fi
if test "$1" = "--help";then
   echo "usage: passwords-save <destdir>
   exit 0
fi
mkdir -p $1
chmod 600 $1
cp -a /etc/passwd $1/passwd
cp -a /etc/group $1/group
cp -a /etc/shadow $1/shadow
test -f /etc/gshadow && cp -a /etc/gshadow $1/gshadow
EOF 
chmod +x /usr/local/bin/passwords-save

cat <<'EOF' > /usr/local/bin/passwords-merge
#!/bin/sh
if test -z "$1";then
   echo "usage: passwords-merge <sourcedir>
   exit 1
fi
if test "$1" = "--help";then
   echo "usage: passwords-merge <sourcedir>
   exit 0
fi
if ! test -x /usr/share/ltsp/client/login/pwmerge; then
    echo "error: dependency \'/usr/share/ltsp/client/login/pwmerge\' is missing"
    exit 1
fi
if test -f $1/passwd; then
    TMP=$(mktemp -d)
    /usr/share/ltsp/client/login/pwmerge $1 /etc/ $TMP/
    cp -a $TMP/* /etc/
    rm -r $TMP
else
    echo "error: \'$1\' not found"
fi
EOF
chmod +x /usr/local/bin/passwords-merge

sed -e"s/PasswordAuthentication no/PasswordAuthentication yes/g" -i /etc/ssh/sshd_config


