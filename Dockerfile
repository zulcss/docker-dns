from alpine:latest

run set -x \
    && apk add --no-cache \
    bind && rm -rf /var/cache/apk/*

copy config/named.conf /etc/bind/named.conf

expose 53 53/udp

cmd ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-f", "-u", "named", "-g"]
