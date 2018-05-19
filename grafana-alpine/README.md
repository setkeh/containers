This Image is Heavily based on the grafana/grafana image.

Example Grafana Compose/Docker Stack

```
version: "3"

networks:
  monitoring:

services:
  grafana:
    image: setkeh/grafana-alpine:latest
    ports:
      - 3000:3000
    networks:
      - monitoring
    volumes:
      - Grafana-ConfigDir/grafana.ini:/etc/grafana/grafana.ini
      - /Storage/Grafana-Storage/:/var/lib/grafana/
    environment:
      GF_SECURITY_ADMIN_PASSWORD: ${GF_PASSWORD:-admin}
      GF_SERVER_ROOT_URL: https://grafana.awx.im
      PROMETHEUS_ENDPOINT: http://prometheus:9090
    deploy:
      mode: replicated
      replicas: 1
      resources:
        limits:
          cpus: '1.00'
          memory: 128M
        reservations:
          cpus: '0.50'
          memory: 64M
```