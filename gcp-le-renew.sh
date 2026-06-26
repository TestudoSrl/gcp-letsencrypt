#!/bin/sh

# Restore working dir into /etc/letsencrypt/
tar -zxf letsencrypt.tar.gz --directory /etc/letsencrypt/

echo $SA_KEY_FILE > certbot.json

# Run the certbot.
# When FORCE_RENEWAL is set (non-empty), append --force-renewal so the
# certificate is reissued even if it is not yet within the renewal window.
if [ -n "$FORCE_RENEWAL" ]; then
  certbot "$@" --force-renewal
else
  certbot "$@"
fi

# Backup into working dir
tar -zcf letsencrypt.tar.gz --directory /etc/letsencrypt/ .
