A docker image containing nginx and php-fpm

Usage:

```
docker run -d -p 80:80 -v /host/nginx/conf.d:/etc/nginx/conf.d -v /host/www:/www <image>
```
