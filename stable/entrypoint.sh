#!/usr/bin/env bash

sed -i 's#http://mydomain.com#'${EXTERNAL_DOMAIN}'/no-auth#g' /var/www/rutorrent/plugins/fileshare/share.php

exec "$@"