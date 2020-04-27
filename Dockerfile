FROM nginx:latest
HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://localhost:80 || exit 1

COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/

EXPOSE 7778