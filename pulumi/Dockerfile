FROM python:3.7.7-alpine3.11

LABEL maintainer="setkeh@gmail.com"
LABEL version="0.0.1"

RUN apk add --update --no-cache ca-certificates gcc build-base python3 py-pip py-virtualenv curl libc6-compat \
    && curl -fsSL https://get.pulumi.com/ | sh \
    && mkdir -p /opt/pulumi \
    && pip install --upgrade pip

WORKDIR /opt/pulumi