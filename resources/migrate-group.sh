#!/bin/sh

set -e

CURRENT=$(id -g "$1")
if [ $CURRENT != "$2" ]; then
    groupmod --gid "$2" "$1"
    find / -user "$CURRENT" -exec chgrp -h "$1" {} \;
fi
