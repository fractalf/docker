#!/bin/sh

if [ $GHOST ]; then

    if [ -d $GHOST/content ]; then
        mv content content-default
        ln -s $GHOST/content content
    fi

    if [ -f $GHOST/config.js ]; then
        mv config.js config.js-default
        ln -s $GHOST/config.js config.js
    fi

fi

exec $@
