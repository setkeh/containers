workflow "Build Containers" {
  on = "push"
  resolves = ["Publish AWS ECR Proxy", "Publish Grafana", "Publish Haproxy Alpine", "Publish JDK 8 Alpine", "Publish Rundeck Alpine", "Publish Archlinux ABS", "Publish Alpine Glibc", "Publish Terraform"]
}

action "Build AWS ECR Proxy" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/aws-ecr-proxy:latest aws-ecr-proxy/"
}

action "Build Haproxy Alpine" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/haproxy-alpine:latest haproxy-alpine/"
}

action "Build JDK 8 Alpine" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/jdk-8-alpine:latest jdk-8-alpine/"
}

action "Build Rundeck Alpine" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/rundeck-alpine:latest rundeck-alpine/"
}

action "Build Archlinux ABS" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/archlinux-abs:latest archlinux-abs/"
}

action "Build Alpine Glibc" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/alpine-glibc:latest alpine-glibc/"
}

action "Build Grafana" {
  needs = ["Build Alpine Glibc"]
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/grafana-alpine:latest grafana-alpine/"
}

action "Build Terraform" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/terraform:latest terraform/"
}

action "Docker Login" {
  needs = ["Build AWS ECR Proxy", "Build Grafana", "Build Haproxy Alpine", "Build JDK 8 Alpine", "Build Rundeck Alpine", "Build Archlinux ABS", "Build Alpine Glibc", "Build Terraform"]
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Publish AWS ECR Proxy" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/aws-ecr-proxy:latest"
}

action "Publish Grafana" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/grafana-alpine:latest"
}

action "Publish Haproxy Alpine" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/haproxy-alpine:latest"
}

action "Publish JDK 8 Alpine" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/jdk-8-alpine:latest"
}

action "Publish Rundeck Alpine" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/rundeck-alpine:latest"
}

action "Publish Archlinux ABS" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/archlinux-abs:latest"
}

action "Publish Alpine Glibc" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/alpine-glibc:latest"
}

action "Publish Terraform" {
  needs = ["Docker Login"]
  uses = "actions/action-builder/docker@master"
  runs = "docker push setkeh/terraform:latest"
}
