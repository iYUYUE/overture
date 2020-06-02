#
# Dockerfile for overture
#

FROM alpine

ARG OVERTURE_VER=v1.6.1
ARG OVERTURE_URL=https://github.com/shawn1m/overture/releases/download/$OVERTURE_VER/overture-linux-amd64.zip

RUN set -ex && \
    apk add --no-cache ca-certificates && \
    cd /tmp && \
    wget $OVERTURE_URL && \
    unzip overture-linux-amd64.zip && \
    mv overture-linux-amd64 /usr/local/bin/overture && \
    rm -rf /tmp/*

COPY root /

RUN chmod +x /usr/local/bin/overture/overture-linux-amd64

USER nobody

CMD ["/usr/local/bin/overture/overture-linux-amd64", "-c", "/etc/overture.json"]


