workflow "Build Containers" {
  on = "push"
  resolves = ["Publish"]
}

action "Build Grafana" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/grafana-alpine:latest grafana-alpine/"
}

action "Build Haproxy Alpine" {
  uses = "actions/docker/cli@master"
  args = "build -t setkeh/haproxy-alpine:latest haproxy-alpine/"
}

action "Docker Login" {
  needs = ["Build Grafana", "Build Haproxy Alpine"]
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
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
