FROM python:3.7.7-alpine3.11

LABEL maintainer="setkeh@gmail.com"
LABEL version="0.0.1"

RUN apk add --update --no-cache ca-certificates gcc build-base python3 python3-dev py3-pip py3-virtualenv gpgme-dev libc-dev curl libc6-compat protobuf protobuf-dev protoc protobuf-c \
    && curl -fsSL https://get.pulumi.com/ | sh \
    && mkdir -p /opt/pulumi \
    && pip install --upgrade pip \
    && pip3 install --upgrade pip awscli==1.16.132 pulumi pulumi-aws

WORKDIR /opt/pulumi