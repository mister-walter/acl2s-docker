#TODO: not sure how to force rebuild (i.e. don't use prebuilt version because it has old SBCL)
#FROM wshito/roswell-base

FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        git \
        automake \
        autoconf \
        libcurl4-openssl-dev \
        ca-certificates

RUN git clone -b release https://github.com/roswell/roswell.git \
    && cd roswell \
    && sh bootstrap \
    && ./configure \
    && make \
    && make install \
    && cd / && rm -rf /tmp/workdir \
    && ros setup

# Needed in general
# openssl-dev is needed for Quicklisp
# perl is needed for ACL2's certification scripts
RUN apt-get install -y --no-install-recommends \
    libssl-dev \
    perl

#RUN git clone --depth 1 https://github.com/acl2/acl2.git /root/acl2
RUN git clone --depth 1 -b 8.2 git://github.com/acl2-devel/acl2-devel.git /root/acl2

COPY build-acl2s.sh /root/build-acl2s.sh
COPY acl2s-image.lisp /root/acl2s-image.lisp

RUN /root/build-acl2s.sh

RUN cd /root \
    && /root/acl2/saved_acl2 < /root/acl2s-image.lisp

CMD ["/root/acl2s"]
