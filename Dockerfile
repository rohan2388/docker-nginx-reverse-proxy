FROM nginx:1.18-alpine

COPY ./install.sh /docker-entrypoint.d/30-proxy-install.sh
COPY ./proxy-template.conf /etc/nginx/proxy-template.conf

RUN chmod +x /docker-entrypoint.d/30-proxy-install.sh
RUN mkdir /etc/nginx/proxies \
  && echo "include /etc/nginx/proxies/*.conf;" >> /etc/nginx/conf.d/default.conf
