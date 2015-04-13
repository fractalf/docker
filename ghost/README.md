### Ghost on iojs (or nodejs) inside Alpine Linux base image 

A docker image containing:

* [Alpine Linux](http://alpinelinux.org/) (base image)
* [iojs](https://iojs.org/) v1.6.4 (or [nodejs](https://nodejs.org/) v0.10.33)
* [Ghost](https://ghost.org/download/) blog v0.5.10

The official [ghost docker image](https://registry.hub.docker.com/u/library/ghost/) use Debian Linux as base image and has a size of **~215 MB**.

This image instead use Alpine Linux as base image which results in a total size of only *~88-96 MB* and also runs ghost on iojs v1.6.4.

Try it out over at [Docker hub](https://registry.hub.docker.com/u/fractalf/ghost/)

####Note!
The binaries of sqlite3 won't work out of the box with *npm install sqlite3* (which is required when installing ghost),  therefore they need to be pre-build in the Alpine Linux container. The pre-build files are included here and was [made like this](https://github.com/fractalf/docker/tree/master/sqlite3)
