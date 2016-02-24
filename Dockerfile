FROM gliderlabs/alpine:3.3

RUN apk add --update \
    curl \
    jq \
    && rm -rf /var/cache/apk/*

WORKDIR /
COPY docker-registry-ls.sh /

CMD ["docker-registry-ls.sh"]
