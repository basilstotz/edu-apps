#!/bin/sh

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --assumeyes --noninteractive install flathub org.gnome.World.PikaBackup



cat <<EOF > /usr/local/bin/pikabackup
#!/bin/sh
flatpak run org.gnome.World.PikaBackup
EOF
chmod +x /usr/local/bin/pikabackup
