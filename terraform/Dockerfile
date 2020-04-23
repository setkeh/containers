FROM golang:alpine
MAINTAINER "James <SETKEH> Griffis <setkeh@gmail.com>"

ENV TERRAFORM_VERSION=0.12.24

RUN apk update && apk upgrade && apk add --update \
      git \
      bash \
      openssh \
      python3-dev \
      python3 \
      tzdata \
      jq && \
    mkdir -p /etc/ssl/certs/ && \
    update-ca-certificates --fresh && \
    pip3 install --upgrade pip awscli==1.16.132

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    go install && \
    cp $GOPATH/bin/terraform /bin/

COPY artefacts/tf-init-plan.sh /bin/tf-init-plan.sh

RUN chmod +x /bin/tf-init-plan.sh

WORKDIR $GOPATH
