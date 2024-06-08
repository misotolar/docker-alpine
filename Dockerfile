FROM alpine:3.20.0

LABEL maintainer="michal@sotolar.com"

COPY resources/entrypoint-hooks.sh /usr/local/bin/entrypoint-hooks.sh
COPY resources/entrypoint-hooks.sh /usr/local/bin/entrypoint-post-hooks.sh

COPY resources/migrate-user.sh /usr/local/bin/migrate-user.sh
COPY resources/migrate-group.sh /usr/local/bin/migrate-group.sh

RUN set -ex; \
    apk add --no-cache \
        shadow \
    ; \
    mkdir -p /usr/local/bin/entrypoint-hooks.d; \
    mkdir -p /usr/local/bin/entrypoint-post-hooks.d; \
    rm -rf \
        /var/cache/apk/* \
        /var/tmp/* \
        /tmp/*
