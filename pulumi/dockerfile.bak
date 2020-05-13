FROM python:alpine3.11

LABEL maintainer="setkeh@gmail.com"
LABEL version="0.0.1"

RUN apk add --update --no-cache ca-certificates gcc build-base python3 cython python3-dev py3-pip py3-virtualenv gpgme-dev libc-dev curl libc6-compat protobuf protobuf-dev protoc protobuf-c bash \
    && curl -fsSL https://get.pulumi.com/ | sh \
    && mkdir -p /opt/pulumi \
    && pip install --upgrade pip \
    && pip3 install --upgrade pip awscli pulumi pulumi-aws
WORKDIR /opt/pulumi