FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nis \
    nfs-kernel-server \
    nfs-common \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /export/shared && chmod 777 /export/shared

CMD ["tail", "-f", "/dev/null"]
