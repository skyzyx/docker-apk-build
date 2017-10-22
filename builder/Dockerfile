FROM alpine:edge

ADD repositories /etc/apk/repositories
RUN apk -U add alpine-sdk coreutils lua-aports

RUN mkdir -p /var/cache/distfiles && \
    adduser -D packager && \
    addgroup packager abuild && \
    chgrp abuild /var/cache/distfiles && \
    chmod g+w /var/cache/distfiles && \
    echo "packager ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    git clone https://github.com/alpinelinux/aports.git ~/aports

ADD setup.sh /home/packager/bin/setup.sh

WORKDIR /work
