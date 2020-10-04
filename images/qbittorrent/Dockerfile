FROM itscontained/ubuntu:focal-20200925 as builder

ARG VERSION

USER root

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    build-essential cmake ninja-build pkg-config git zlib1g-dev libssl-dev libgeoip-dev \
    libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev \
    qtbase5-dev qttools5-dev libqt5svg5-dev \
    libtorrent-rasterbar-dev

WORKDIR /tmp

RUN git clone --depth 1 -b release-${VERSION} https://github.com/qbittorrent/qBittorrent.git . \
    && ./configure --disable-gui \
    && make \
    && make install

FROM itscontained/ubuntu:focal-20200925

# Proper way to set config directory
ENV HOME=/config \
    XDG_CONFIG_HOME=/config \
    XDG_DATA_HOME=/config \
    WEBUI_PORT=8080

USER root

RUN \
  apt-get -qq update \
  && apt-get install -y --no-install-recommends \
    python3 \
    p7zip-full \
    unrar \
    geoip-bin \
    unzip \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER itscontained

RUN mkdir -p /app/qbittorrent/bin /config/qBittorrent/qBittorrent.conf /tmp/incomplete

COPY --from=builder /usr/local/bin/qbittorrent-nox /app/qbittorrent/bin/qbittorrent
COPY qBittorrent.conf /config/qBittorrent

EXPOSE 6881 6881/udp ${WEBUI_PORT}

CMD umask ${UMASK} && /app/qbittorrent/bin/qbittorrent --webui-port="${WEBUI_PORT}"
