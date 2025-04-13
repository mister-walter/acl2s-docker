FROM atwalter/acl2:latest
#FROM ghcr.io/mister-walter/acl2:latest
LABEL org.opencontainers.image.source="https://github.com/mister-walter/acl2s-docker"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        automake \
        autoconf \
    && rm -rf /var/lib/apt/lists/* # remove cached apt files

RUN mkdir /root/acl2s

COPY acl2s-image.lisp /root/acl2s/acl2s-image.lisp

ARG ACL2_BUILD_OPTS=""
ARG ACL2_CERTIFY_OPTS="-j 4"
ENV CERT_PL_RM_OUTFILES="1"

RUN umask 002 && cd /root/acl2/books \
    && make acl2s $ACL2_CERTIFY_OPTS \
    && cd /root/acl2s \
    && acl2 < acl2s-image.lisp \
    && mkdir -p /opt/acl2s/bin \
    && ln -s /root/acl2s/acl2s /opt/acl2s/bin/acl2s

ENV PATH="/opt/acl2s/bin:${PATH}"

CMD ["/root/acl2s/acl2s"]
