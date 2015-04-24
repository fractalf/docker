### Alpine Linux base image running Ghost on iojs

A docker image containing:

* [Alpine Linux](http://alpinelinux.org/) (base image)
* [iojs](https://iojs.org/) v1.6.4
* [Ghost](https://ghost.org/download/) v0.6.0

The [official ghost docker image](https://registry.hub.docker.com/u/library/ghost/) runs Ghost on nodejs with Debian Linux as base image and has a size of **~215 MB**.

This image use Alpine Linux as base image which results in a total size of only **~96 MB** and runs Ghost on iojs v1.6.4.

Try it out over at [Docker hub](https://registry.hub.docker.com/u/fractalf/ghost/)

####Note!
The binaries of sqlite3 won't work out of the box with *npm install sqlite3* (which is required when installing ghost),  therefore they need to be pre-build in the Alpine Linux container. The pre-build files are included here and was [made like this](https://github.com/fractalf/docker/tree/master/sqlite3)

Some inspiration taken from [the official ghost repo](https://github.com/docker-library/ghost)
