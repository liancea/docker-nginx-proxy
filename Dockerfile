FROM jwilder/nginx-proxy

# allow nginx to interpret incoming PROXY protocol input (ports 81 and 1443)
# also enable realip module, trusted upstream proxy is defined in environment
COPY ./nginx.tmpl /app/nginx.tmpl

# Increase worker_connections (used to become "ddosed" before)
# also disable checking of body size (causes problems with seafile, and probably other file-uploading services)
COPY ./nginx.conf /etc/nginx/nginx.conf
