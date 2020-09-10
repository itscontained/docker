FROM ubuntu:focal
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
  mkdir -p /app /data \
  && chown -R itscontained:itscontained /app /data

RUN \
  export ARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) \
  && apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    gnupg2 \
    vim-tiny \
    curl \
    ca-certificates \
  && curl -L -o /sbin/tini https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-${ARCH} \
  && curl -L -o /tini.asc https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-${ARCH}.asc \
  && gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
  && gpg --batch --verify /tini.asc /sbin/tini \
  && gpgconf --kill all \
  && apt-get remove -y gnupg2 \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
    /tini.asc \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/cache/apt/* \
    /var/tmp/*

WORKDIR /data

USER itscontained:itscontained

VOLUME [ "/data" ]

ENTRYPOINT [ "/sbin/tini", "--" ]
