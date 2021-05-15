FROM alpine:latest

LABEL maintainer "James Griffis <setkeh@gmail.com>"

ENV GLIBC_VERSION=2.33-r0

RUN set -ex \
  && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && apk add --update --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/community dumb-init \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
  && apk add glibc-${GLIBC_VERSION}.apk
