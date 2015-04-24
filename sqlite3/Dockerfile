FROM alpine:edge

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update iojs python make gcc libc-dev g++ && \
    echo "npm install sqlite3 --build-from-source" > /build.sh && \
    echo "cd node_modules" >> /build.sh && \
    echo "tar czf /export/sqlite3.tar.gz sqlite3" >> /build.sh && \
    chmod a+x /build.sh

CMD ["sh", "/build.sh"]
