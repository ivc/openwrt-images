FROM debian:12
RUN set -ex; \
  useradd -m builder -u 1000; \
  apt-get update -q; \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    file \
    gawk \
    gettext \
    git \
    libncurses5-dev \
    libncursesw5-dev \
    libssl-dev \
    python3 \
    rsync \
    unzip \
    wget \
    xsltproc \
    zlib1g-dev \
  ; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*
ARG BUILDER_URL
ARG BUILDER_SHA256
RUN \
  --mount=type=bind,src=get-image-builder,dst=/usr/local/bin/get-image-builder \
  get-image-builder $BUILDER_URL $BUILDER_SHA256 --strip-components=1 -xJC /home/builder
USER 1000
WORKDIR /home/builder
