FROM alpine:3.6
LABEL maintainer="Yorick Poels <yorick.poels@gmail.com>"

ENV COREDNS_VERSION=0.9.9

RUN apk add --no-cache bind-tools ca-certificates openssl curl &&\
                 update-ca-certificates &&\
                 rm -rf /var/cache/apk/* 

RUN curl --silent --show-error --fail --location \
    --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \ 
    "https://github.com/coredns/coredns/releases/download/v${COREDNS_VERSION}/coredns_${COREDNS_VERSION}_linux_x86_64.tgz" \
    | tar --no-same-owner -C /usr/bin/ -xz coredns \
    && chmod 0755 /usr/bin/coredns \
    && /usr/bin/coredns -version

EXPOSE 53 

VOLUME ["/etc/coredns/"]

ENTRYPOINT ["/usr/bin/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]
