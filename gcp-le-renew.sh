#!/bin/sh

# Restore working dir into /etc/letsencrypt/
tar -zxf letsencrypt.tar.gz --directory /etc/letsencrypt/

echo $SA_KEY_FILE > certbot.json

# Run the certbot
certbot "$@"

# Backup into working dir
tar -zcf letsencrypt.tar.gz --directory /etc/letsencrypt/ .
