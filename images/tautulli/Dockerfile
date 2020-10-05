FROM itscontained/ubuntu:focal-20200925

ARG VERSION

USER root

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    python3 \
    python3-pip \
  && pip3 install --no-cache-dir -U \
	  mock \
	  plexapi \
	  pycryptodomex \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER itscontained

RUN \
  curl -Lso /tmp/tautulli.tar.gz \
    "https://github.com/Tautulli/Tautulli/archive/v${VERSION}.tar.gz" \
  && mkdir -p /app/tautulli/bin \
  && tar ixzf /tmp/tautulli.tar.gz -C /app/tautulli/bin --strip-components 1 \
  && echo "${VERSION}" > /app/tautulli/bin/version.txt \
  && echo "master" > /app/tautulli/bin/branch.txt \
  && rm -rf \
       /tmp/tautulli.tar.gz

EXPOSE 8181

CMD umask ${UMASK} && python3 /app/tautulli/bin/Tautulli.py --datadir /config --nolaunch
