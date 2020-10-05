FROM itscontained/ubuntu:focal-20200925

ARG VERSION

USER root

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    unzip \
    unrar \
    p7zip \
    python2 \
    wget \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER itscontained

RUN \
  curl -Lso /tmp/nzbget.run \
    "https://github.com/nzbget/nzbget/releases/download/v${VERSION}/nzbget-${VERSION}-bin-linux.run" \
  && mkdir -p /app/nzbget/bin \
  && sh /tmp/nzbget.run --destdir /app/nzbget/bin \
  && rm -rf \
       /tmp/nzbget-${VERSION}-bin-linux.run

EXPOSE 6789

CMD umask ${UMASK} && /app/nzbget/bin/nzbget -s -c /config/nzbget.conf -o OutputMode=log
