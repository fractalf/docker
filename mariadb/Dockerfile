FROM alpine:edge

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add mariadb mariadb-client && \
    apk upgrade

EXPOSE 3306
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld_safe"]