FROM itscontained/ubuntu:focal-20200925

ARG VERSION

ENV DATA_DIR=/config

USER root

#
RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    build-essential \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/tmp/ \
  && mkdir /home/itscontained \
  && chown itscontained:itscontained /home/itscontained \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER itscontained

RUN \
  curl -Lso /tmp/conreq.tgz \
      "https://github.com/archmonger/conreq/archive/${VERSION}.tar.gz" \
  && tar ixzf /tmp/conreq.tgz -C /app --strip-components 1 \
  && pip3 install --no-cache-dir -U -r /app/requirements.txt \
  && rm -rf \
       /tmp/conreq.tgz

ADD /credentials.json.example /app/credentials.json.example
ADD /entrypoint.sh /app/entrypoint.sh

EXPOSE 8000

WORKDIR /config

CMD umask ${UMASK} && /app/entrypoint.sh
