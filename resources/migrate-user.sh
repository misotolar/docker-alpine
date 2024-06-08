#!/bin/sh

set -e

CURRENT=$(id -u "$1")
if [ $CURRENT != "$2" ]; then
    usermod --uid "$2" "$1"
    find / -user "$CURRENT" -exec chown -h "$1" {} \;
fi
