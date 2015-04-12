* Build sqlite3 binaries

docker run -it --rm alpine:edge /bin/sh

<iojs only>
echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
</iojs only>

apk add --update iojs python make gcc libc-dev g++
cd /tmp
npm install sqlite3 --build-from-source
cd node_modules
tar czf sqlite3.tar.gz sqlite3/
