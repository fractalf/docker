### Ghost on Alpine Linux (iojs or nodejs)

A docker image containing:

* [Alpine Linux](http://alpinelinux.org/) (base image)
* [nodejs](https://nodejs.org/) or [iojs](https://iojs.org/)
* [Ghost](https://ghost.org/download/)

The official [ghost docker image](https://registry.hub.docker.com/u/library/ghost/) use Debian Linux as base image and has a size of **~215 MB**.

This image instead use Alpine Linux as base image which results in a total size of only **~140 MB** and also runs ghost on iojs.

####Note!
The binaries of sqlite3 won't work out of the box with *npm install sqlite3* (which is required when installing ghost),  therefore they need to be pre-build in the Alpine Linux container. The pre-build files are included here and was [made like this](https://github.com/fractalf/docker/tree/master/sqlite3)
