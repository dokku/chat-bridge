FROM ubuntu:24.04

WORKDIR /app

RUN apt-get update && apt-get install -y curl file && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://github.com/gliderlabs/sigil/releases/download/v0.11.0/sigil-linux-amd64 /bin/sigil
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /bin/tini
ADD https://github.com/42wim/matterbridge/releases/download/v1.26.0/matterbridge-1.26.0-linux-64bit /bin/matterbridge
RUN chmod +x /bin/matterbridge /bin/sigil /bin/tini

COPY Procfile run /app/
COPY matterbridge.toml.sigil /app/matterbridge.toml.sigil

ENTRYPOINT ["/bin/tini", "--"]
