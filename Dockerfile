FROM nginx:latest
HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://localhost:80 || exit 1
EXPOSE 7778