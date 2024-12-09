FROM alpine:3.21.0

LABEL maintainer="michal@sotolar.com"

COPY resources/entrypoint-hooks.sh  /usr/local/bin/entrypoint-hooks.sh
COPY resources/entrypoint-hooks.sh  /usr/local/bin/entrypoint-post-hooks.sh
COPY resources/entrypoint-common.sh /usr/local/bin/entrypoint-common.sh

RUN set -ex; \
    apk add --no-cache \
        shadow \
    ; \
    rm -rf \
        /var/cache/apk/* \
        /var/tmp/* \
        /tmp/*
