FROM atwalter/acl2:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        automake \
        autoconf \
    && rm -rf /var/lib/apt/lists/* # remove cached apt files

COPY acl2s-image.lisp /root/acl2s-image.lisp

ARG ACL2_CERTIFY_OPTS="-j 4"

RUN cd /root/acl2/books \
    && make acl2s ACL2=/root/acl2/saved_acl2 $ACL2_CERTIFY_OPTS \
    && cd /root \
    && /root/acl2/saved_acl2 < /root/acl2s-image.lisp

RUN apt-get remove -y \
    build-essential \
    automake \
    autoconf \
    && apt-get autoremove -y

CMD ["/root/acl2s"]
