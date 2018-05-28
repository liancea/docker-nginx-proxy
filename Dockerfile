FROM jwilder/nginx-proxy

# allow nginx to interpret incoming PROXY protocol input
RUN sed -i -E 's/(\s+listen.[^;]+);/\1 proxy_protocol;/' /app/nginx.tmpl

