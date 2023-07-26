FROM ghcr.io/3kmfi6hp/argo-airport-paas:main
EXPOSE 3000
RUN cd /app && rm -rf web.js
# Health check
HEALTHCHECK --interval=2m --timeout=30s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:${PORT}/status || exit 1
