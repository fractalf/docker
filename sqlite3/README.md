Builds sqlite3 module binaries for iojs on Alpine Linux
```
docker build -t username/sqlite3 .
```

Usage:
```
docker run -it --rm -v $(pwd):/export username/sqlite3
```

This gives you the file *sqlite3.tar.gz* in your current directory.
