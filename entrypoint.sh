#!/bin/sh
/usr/sbin/sshd > /dev/null 2>&1
sleep 1
echo " * sshd ......... [OK]"
sleep 2
/usr/bin/grafana server --config /etc/grafana.ini --homepath /usr/share/grafana > /dev/null 2>&1 &
echo " * grafana....... [OK]"
exec "$@"
