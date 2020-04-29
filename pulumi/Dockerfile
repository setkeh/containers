FROM alpine:latest

LABEL maintainer="setkeh@gmail.com"
LABEL version="0.0.1"

RUN apk add --update --no-cache ca-certificates python3 py-pip py-virtualenv curl libc6-compat \
    && curl -fsSL https://get.pulumi.com/ | sh \
    && mkdir -p /opt/pulumi \
    && pip install --upgrade pip

WORKDIR /opt/pulumi