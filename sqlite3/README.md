### Build sqlite3 binaries

Builds sqlite3 module binaries for nodejs/iojs on Alpine Linux

Example usage:
```
ln -s Dockerfile-iojs Dockerfile
docker build -t sqlite3 .
docker run -v /target/path:/sqlite3 --rm sqlite3 mv sqlite3-iojs.tar.gz /sqlite3
```

