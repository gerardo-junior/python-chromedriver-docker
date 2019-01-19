#!/bin/sh

if [ -e "$(pwd)/requirements.txt" ]; then
    /usr/local/bin/pip install --no-cache-dir -r requirements.txt
fi

if [ ! -z "$1" ]; then
    if [ -z "$(which -- $1)" ]; then
        python "$@"
    else
        exec "$@"
    fi
fi
