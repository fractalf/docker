### Alpine Linux base image running Ghost on iojs

A docker image containing:

* [Alpine Linux](http://alpinelinux.org/) (base image)
* [iojs](https://iojs.org/) v1.6.4
* [Ghost](https://ghost.org/download/) v0.6.2

The [official ghost docker image](https://registry.hub.docker.com/u/library/ghost/) runs Ghost on nodejs with Debian Linux as base image and has a size of **~228 MB**.
This image use Alpine Linux as base image which results in a total size of only **~105 MB** and runs Ghost on iojs instead of nodejs.
Try it out over at [Docker hub](https://registry.hub.docker.com/u/fractalf/ghost/).

Basic usage (testing)
```
docker run -d -p 80:2368 <image>
```

Advanced usage (docker data volume)
```
docker run -d -p 80:2368 -e GHOST=/data/mysite.com -v /host/www/mysite.com:/data/mysite.com <image>
```

Advanced usage (docker data volume container)
```
docker run -d -p 80:2368 -e GHOST=/data/mysite.com --volumes-from dataContainer <image>
```

Set *$GHOST* to to the folder for ghost content and config.
A typical folder structure:
```
/data/mysite.com/content/apps
/data/mysite.com/content/data
/data/mysite.com/content/images
/data/mysite.com/content/themes
/data/mysite.com/confing.js
```
