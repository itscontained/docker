FROM python:3.9-buster

ARG TARGETPLATFORM
ARG VERSION

RUN mkdir /app

WORKDIR /app

RUN git clone https://github.com/gregzaal/Auto-Voice-Channels.git . \
    && git checkout ${VERSION:-master}
    && mkdir guilds \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir uvloop
    && rm -r .git .github

CMD python auto-voice-channels.py
