FROM jwilder/nginx-proxy

# allow nginx to interpret incoming PROXY protocol input (ports 81 and 1443)
COPY ./nginx.tmpl /app/nginx.tmpl

# Increase worker_connections (used to become "ddosed" before)
RUN sed -E -i 's/^[ \t]*worker_connections[ \t]*[0-9]+;/    worker_connections  10240;/' /etc/nginx/nginx.conf
