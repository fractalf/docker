FROM alpine:latest

ENV NGINX_VERSION nginx-1.9.1

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add php-fpm php-mysqli php-pdo_mysql php-pdo_sqlite php-json openssl-dev pcre-dev zlib-dev wget build-base && \
    mkdir -p /tmp && \
    cd /tmp && \
    wget http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
    tar -zxvf ${NGINX_VERSION}.tar.gz && \
    cd /tmp/${NGINX_VERSION} && \
    ./configure \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --prefix=/etc/nginx \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --sbin-path=/usr/local/sbin/nginx && \
    make && \
    make install && \
    sed -i '117i\    include /etc/nginx/conf.d/*.conf;' /etc/nginx/conf/nginx.conf && \
    apk del build-base && \
    rm -rf /tmp/* /var/cache/apk/* && \
    echo 'php-fpm -D' > /start.sh && \
    echo 'nginx -g "daemon off;"' >> /start.sh && \
    chmod a+x /start.sh

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443
CMD ["sh", "/start.sh"]
