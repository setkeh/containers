FROM python:3.8-slim

LABEL maintainer="setkeh@gmail.com"
LABEL version="0.0.1"

RUN apt-get update -y \
    && apt-get install bash curl -y \
    && curl -fsSL https://get.pulumi.com/ | sh \
    && /root/.pulumi/bin/pulumi plugin install resource aws v2.4.0 \
    && mkdir -p /opt/pulumi \
    && pip install --upgrade pip awscli pulumi pulumi-aws
WORKDIR /opt/pulumi