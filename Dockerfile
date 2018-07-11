FROM jwilder/nginx-proxy

# allow nginx to interpret incoming PROXY protocol input (ports 81 and 1443)
# also enable realip module, trusted upstream proxy is defined in environment
COPY ./nginx.tmpl /app/nginx.tmpl

# Increase worker_connections (used to become "ddosed" before)
# also disable checking of body size (causes problems with seafile, and probably other file-uploading services)
COPY ./nginx.conf /etc/nginx/nginx.conf

# custom entrypoint to update nginx.conf before start
# along with copied entry from upstream image (because changing the entrypoint messes with the CMD)
COPY ./liancea-metawrapper.sh /app/liancea-metawrapper.sh
RUN chmod 0755 /app/liancea-metawrapper.sh
ENTRYPOINT ["/app/liancea-metawrapper.sh"]
CMD ["forego", "start", "-r"]
