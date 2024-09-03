#!/bin/sh

set -e

if ! getent passwd "$1" > /dev/null 2>&1; then
    exit 1
fi

CURRENT=$(getent passwd "$1" | cut -d: -f3)
if [ $CURRENT != "$2" ]; then
    usermod --uid "$2" "$1"
    find / -user "$CURRENT" -exec chown -h "$1" {} \;
fi
