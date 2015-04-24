FROM alpine:edge

ADD sqlite3.tar.gz /ghost/node_modules/
COPY entrypoint.sh /entrypoint.sh

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update wget iojs && \
    apk upgrade && \
    wget -q --no-check-certificate https://ghost.org/zip/ghost-0.6.0.zip -O /tmp/ghost.zip && \
    unzip -q /tmp/ghost.zip -d /ghost && \
    cd /ghost && \
    npm install --production && \
    sed 's/127.0.0.1/0.0.0.0/' /ghost/config.example.js > /ghost/config.js && \
    sed -i s/\"iojs\":\ \"~1\.2\.0\"/\"iojs\":\ \"~1\.6\.4\"/ package.json && \
    adduser ghost -D -h /ghost -s /bin/sh && \
    npm cache clean && \
    rm -rf /var/cache/apk/* /tmp/*

WORKDIR /ghost
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 2368
CMD ["npm", "start", "--production"]
