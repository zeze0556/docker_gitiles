#!/bin/sh

rm -rf /var/run/fcgiwrap.socket
fcgiwrap -c 16 -s unix:/var/run/fcgiwrap.socket &
sleep 2
chmod a+rwx /var/run/fcgiwrap.socket
nginx -g "daemon off;"
