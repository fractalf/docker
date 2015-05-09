FROM alpine:edge

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add -U iojs wget ca-certificates python make gcc libc-dev g++ && \
    apk upgrade && \
    adduser ghost -D -h /ghost -s /bin/sh && \
    wget -q https://ghost.org/zip/ghost-0.6.2.zip -O /tmp/ghost.zip && \
    unzip -q /tmp/ghost.zip -d /ghost && \
    cd /ghost && \
    npm install sqlite3 --build-from-source && \
    npm install --production && \
    sed 's/127.0.0.1/0.0.0.0/' /ghost/config.example.js > /ghost/config.js && \
    sed -i 's/"iojs": "~1.2.0"/"iojs": "~1.6.4"/' package.json && \
    chown -R ghost.ghost * && \
    apk del wget ca-certificates python make gcc libc-dev g++ && \
    npm cache clean && \
    rm -rf /var/cache/apk/* /tmp/* /root/.node-gyp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 2368
USER ghost
WORKDIR /ghost
CMD ["npm", "start", "--production"]
