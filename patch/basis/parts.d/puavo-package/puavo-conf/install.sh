#!/bin/sh

FILE="/usr/local/bin/puavo-conf"

cat <<'EOF'> $FILE
#!/bin/sh

case $1 in
EOF

while read -r KEY VALUE; do
    if test -n "$KEY"; then
        echo "     $KEY) echo \"$VALUE\" ;;" >> $FILE
    fi
done < $(pwd)/puavo-conf.list

cat <<'EOF'>> $FILE
     *) echo -n "" ;;
esac
exit 0
EOF

chmod +x $FILE

