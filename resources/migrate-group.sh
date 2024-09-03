#!/bin/sh

set -e

if ! getent group "$1" > /dev/null 2>&1; then
    exit 1
fi

CURRENT=$(getent group "$1" | cut -d: -f3)
if [ $CURRENT != "$2" ]; then
    groupmod --gid "$2" "$1"
    find / -group "$CURRENT" -exec chgrp -h "$1" {} \;
fi
