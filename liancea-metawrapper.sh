#!/bin/bash
set -ue

# replace trusted real_ip origins from environment upon startup
sed -i -e "s/^\\s*set_real_ip_from.*;/    set_real_ip_from ${UPSTREAM_HAPROXY_IP};/g" /etc/nginx/nginx.conf

# do the rest
exec /app/docker-entrypoint.sh "$@"
