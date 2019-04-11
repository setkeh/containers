FROM golang:alpine
MAINTAINER "James <SETKEH> Griffis <setkeh@gmail.com>"

ENV TERRAFORM_VERSION=0.10.0

RUN apk add --update git bash openssh

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    go install terraform

WORKDIR $GOPATH
