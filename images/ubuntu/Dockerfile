FROM ubuntu:focal-20200925
LABEL maintainer="itscontained"

ARG TARGETPLATFORM=linux/amd64

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    UMASK=0002 \
    TINI_VERSION=0.19.0

RUN \
  adduser itscontained \
  --uid 568 \
  --group \
  --system \
  --disabled-password \
  --no-create-home

RUN \
  mkdir -p /app /config \
  && chown -R itscontained:itscontained /app /config

RUN set -eux \
  && \
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='amd64' ;; \
    'linux/arm64') export ARCH='arm64' ;; \
    'linux/arm/v7') export ARCH='armhf' ;; \
  esac \
  && apt -qq update \
  && apt -qq install -y --no-install-recommends \
       gnupg2 \
       curl \
       ca-certificates \
       vim-tiny \
  && curl -L -o /sbin/tini https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-${ARCH} \
  && curl -L -o /tini.asc https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-${ARCH}.asc \
  && gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
  && gpg --batch --verify /tini.asc /sbin/tini \
  && chmod +x /sbin/tini \
  && gpgconf --kill all \
  && apt remove -y gnupg2 \
  && apt purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt autoremove -y \
  && apt clean \
  && rm -rf \
       /tini.asc \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/cache/apt/* \
       /var/tmp/*

WORKDIR /config

USER itscontained:itscontained

ENTRYPOINT [ "/sbin/tini", "--" ]
