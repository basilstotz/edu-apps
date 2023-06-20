#!/bin/sh


apt-get --yes install autossh


mkdir -p /etc/service-tunnel
chmod 700 /etc/service-tunnel
cat <<EOF > /etc/service-tunnel/tunnel.config
REMOTE=""
HOST="backup.amxa.ch"
USER="tunnel"
PORT="443"
KEY="/etc/service-tunnel/tunnel.key"
OPTS=""
EOF

mkdir -p /usr/local/sbin
cat <<'EOF' > /usr/local/sbin/service-tunnel
#!/bin/sh

CONFIG="/etc/service-tunnel/tunnel.config"

if test -e ${CONFIG}; then

    . ${CONFIG}

    test -f ${KEY} || sleep infinity

    chmod 600 ${KEY}
    while true; do
	if ping -c 1  ${HOST} 2>/dev/null >/dev/null; then
            /usr/bin/autossh -M 0 -N -p ${PORT} -i ${KEY} ${OPTS} -R ${REMOTE}:localhost:22 ${USER}@${HOST}
        fi
	sleep 300
    done
else
    sleep infinity
fi
EOF
chmod +x /usr/local/sbin/service-tunnel


cat <<EOF > /etc/systemd/system/service-tunnel.service
[Unit]
Description=Tunnel for amXa
After=syslog.target network.target nss-lookup.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/service-tunnel
#ExecReload=/bin/kill -s HUP $MAINPID
#ExecStop=/bin/kill -s QUIT $MAINPID
Restart=always
RestartSec=300

[Install]
WantedBy=multi-user.target
EOF
systemctl enable service-tunnel.service

echo "23 04 * * * root /usr/bin/systemctl restart service-tunnel.service" > /etc/cron.d/service-tunnel-restart

exit
