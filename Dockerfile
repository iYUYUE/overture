#
# Dockerfile for overture
#

FROM alpine

ARG OVERTURE_VER=v1.4
ARG OVERTURE_URL=https://github.com/shawn1m/overture/releases/download/$OVERTURE_VER/overture-linux-amd64.zip

COPY root /

RUN set -ex && \
    apk add --no-cache ca-certificates && \
    cd /tmp && \
    wget $OVERTURE_URL && \
    unzip overture-linux-amd64.zip && \
    mkdir -p /usr/local/bin/overture && \
    mv overture-linux-amd64 /usr/local/bin/overture && \
    wget https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt && \
    wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt && \
    mv *.txt /etc/overture && \
    rm -rf /tmp/*

RUN chmod +x /usr/local/bin/overture/overture-linux-amd64

CMD ["/usr/local/bin/overture/overture-linux-amd64", "-c", "/etc/overture/config.json"]

# USER nobody