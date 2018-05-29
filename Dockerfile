FROM jwilder/nginx-proxy

# allow nginx to interpret incoming PROXY protocol input (ports 81 and 1443)
COPY ./nginx.tmpl /app/nginx.tmpl
