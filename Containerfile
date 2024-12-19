FROM ghcr.io/ntkme/systemd-podman:edge

RUN podman pull docker.io/library/caddy:2-alpine
RUN podman pull docker.io/library/elasticsearch:8.10.4
RUN podman pull docker.io/library/postgres:16-alpine
RUN podman pull docker.io/library/redis:6-alpine
RUN podman pull docker.io/minio/mc:latest
RUN podman pull docker.io/minio/minio:latest
RUN printf '%s\n' \
           '[[registry]]' \
           'prefix = "localhost"' \
           'location = "localhost"' \
           'insecure = true' \
  | tee /etc/containers/registries.conf.d/localhost.conf
RUN podman pull localhost:5000/feedbin:edge
RUN rm /etc/containers/registries.conf.d/localhost.conf \
 && rm -rf /usr/share/containers/storage \
 && mv /var/lib/containers/storage /usr/share/containers/storage

ADD etc /etc
ADD usr /usr

VOLUME ["/data"]
