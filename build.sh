#!/bin/bash
set -ev

build_containers() {
  echo Build Apline GLIBC
  docker build -t setkeh/alpine-glibc:latest alpine-glibc/Dockerfile
}

push_containers() {
  docker push setkeh/alpine-glibc:latest
}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
build_containers
push_containers