ARG ALPINE_VERSION=3.20

FROM alpine:${ALPINE_VERSION}
LABEL MAINTAINER="Marcello Percoco <marcello.percoco@gmail.com>"

RUN apk update \
        && apk upgrade --no-cache

RUN apk add --no-cache \
    bash       \
    curl       \
    ipvsadm    \
    iproute2   \
    keepalived 

# set keepalived as image entrypoint with --dont-fork and --log-console (to make it docker friendly)
# define /etc/keepalived/keepalived.conf as the configuration file to use
ENTRYPOINT ["/usr/sbin/keepalived","--dont-fork","--log-console", "-f","/usr/local/etc/keepalived/keepalived.conf"]
