### Ghost on Alpine Linux (iojs or nodejs)

A docker image containing:

* [Alpine Linux](http://alpinelinux.org/) (base image)
* [nodejs](https://nodejs.org/) or [iojs](https://iojs.org/)
* [Ghost](https://ghost.org/download/)

The official [ghost docker image](https://registry.hub.docker.com/u/library/ghost/) has a size of **~215 MB** and is build on top of a debian base image.

This image is build on the Apine Linux base image with a size of **~140 MB** and also runs ghost on iojs.

####Note!
The binaries of sqlite3 won't work out of the box with *npm install sqlite3* (which is required when installing ghost),  therefore they need to be pre-build in the Alpine Linux container. The pre-build files are included here and was [made like this](https://github.com/fractalf/docker/tree/master/sqlite3)