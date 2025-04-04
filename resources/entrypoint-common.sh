#!/bin/sh

user_exists() {
    if getent passwd "$1" > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

migrate_uid() {
    user_exists "$1" || return 1

    ID=$(getent passwd "$1" | cut -d: -f3)

    if [ "$ID" != "$2" ]; then
        usermod --uid "$2" "$1"
        find "${3:-/}" -user "$ID" -exec chown -h "$1" {} \;
    fi

    return 0
}

group_exists() {
    if getent group "$1" > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

migrate_gid() {
    group_exists "$1" || return 1

    ID=$(getent group "$1" | cut -d: -f3)

    if [ "$ID" != "$2" ]; then
        groupmod --gid "$2" "$1"
        find "${3:-/}" -group "$ID" -exec chgrp -h "$1" {} \;
    fi

    return 0
}
