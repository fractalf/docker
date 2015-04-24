#!/bin/sh

# Set $GHOST to the folder for ghost content and config
# Usage:
#   1) docker run -d -e GHOST=/data -v /host/ghost/data:/data <image>
#   2) docker run -d -e GHOST=/data --volumes-from dataContainer <image>

if [ ! -z ${GHOST+x} ]; then

    if [ -d "$GHOST/content" ]; then
        mv "content" "content-default"
        ln -s "$GHOST/content" "content"
    fi

    if [ -f "$GHOST/config.js" ]; then
        mv "config.js" "config.js-default"
        ln -s "$GHOST/config.js" "config.js"
    fi

fi

exec "$@"
