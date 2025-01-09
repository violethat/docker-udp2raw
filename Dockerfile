FROM alpine:3.12

LABEL \
    org.opencontainers.image.title="udp2raw" \
    org.opencontainers.image.authors="akafeng <i@sjy.im>" \
    org.opencontainers.image.source="https://github.com/akafeng/docker-udp2raw"

ARG UDP2RAW_VERSION="20230206.0"
ARG UDP2RAW_URL="https://github.com/wangyu-/udp2raw-tunnel/releases/download/${UDP2RAW_VERSION}/udp2raw_binaries.tar.gz"

RUN set -eux \
    && apk add --no-cache \
        tzdata \
    \
    && wget -O udp2raw_binaries.tar.gz ${UDP2RAW_URL} \
    && tar -xzvf udp2raw_binaries.tar.gz udp2raw_amd64_hw_aes -C /usr/local/bin/ \
    && mv /usr/local/bin/udp2raw_amd64_hw_aes /usr/local/bin/udp2raw \
    && rm -rf udp2raw_binaries.tar.gz

ENTRYPOINT ["udp2raw"]
