#!/bin/sh
chown lighttpd:lighttpd /var/log/lighttpd
chown lighttpd:lighttpd /var/www/localhost/htdocs/mytinytodo/db
chown lighttpd:lighttpd /var/www/localhost/htdocs/mytinytodo/
echo "Starting lighttpd..."
exec /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
