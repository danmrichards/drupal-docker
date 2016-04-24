#!/bin/sh

# Run the pre-start script if it exists.
[ -f /pre-start.sh ] && /pre-start.sh

# Create the web directory.
if [ ! -d /opt/www ] ; then
  mkdir -p /opt/www
  chown nginx:www-data /opt/www
fi

# Start PHP FPM.
mkdir -p /opt/logs/php-fpm
php-fpm

# Start nginx.
mkdir -p /opt/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
nginx
