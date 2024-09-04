#!/bin/sh

set -e

HOOKS=$(basename "$0")

if [ -d "/usr/local/bin/${HOOKS%.*}.d" ]; then
    find "/usr/local/bin/${HOOKS%.*}.d" -maxdepth 1 -iname '*.sh' '(' -type f -o -type l ')' -print | sort | while read -r HOOK; do
        sh -c "$HOOK"
    done
fi
