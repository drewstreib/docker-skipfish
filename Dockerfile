FROM alpine:3.1

ENV VERSION_SKIPFISH 2.10b

RUN apk --update add libc-dev make gcc openssl openssl-dev pcre-dev libidn-dev zlib-dev && rm -f /var/cache/apk/* 
RUN mkdir -p /opt && cd /opt && wget \
"http://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/skipfish/skipfish-$VERSION_SKIPFISH.tgz" && \
tar xvzf skipfish-$VERSION_SKIPFISH.tgz && rm -f skipfish-$VERSION_SKIPFISH.tgz && \
ln -sf skipfish-$VERSION_SKIPFISH skipfish && cd skipfish-$VERSION_SKIPFISH && make && \
mkdir /work && adduser -D -s /bin/sh user user && chown -R user /work /opt/skipfish-$VERSION_SKIPFISH

USER user

# install -m 755 skipfish /usr/local/bin/

VOLUME /work
WORKDIR /opt/skipfish

ENTRYPOINT ["/opt/skipfish/skipfish"]

CMD ["-h"]
