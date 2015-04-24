#!/bin/sh

# If $VIRTUAL_HOST is set we look for ghost content and config in /data/$VIRTUAL_HOST
# Also works with nginx-proxy (https://registry.hub.docker.com/u/jwilder/nginx-proxy/)
# Usage:
#   1) docker run -d -v /myhost/data:/data -e VIRTUAL_HOST=foo.bar.com 
#   2) docker run -d --volumes-from data -e VIRTUAL_HOST=foo.bar.com
if [ ! -z ${VIRTUAL_HOST+x} ]; then

    if [ -d "/data/$VIRTUAL_HOST/content" ]; then
        mv "content" "content-default"
        ln -s "/data/$VIRTUAL_HOST/content" "content"
    fi

    if [ -f "/data/$VIRTUAL_HOST/config.js" ]; then
        mv "config.js" "config.js-default"
        ln -s "/data/$VIRTUAL_HOST/config.js" "config.js"
    fi

fi

exec "$@"
