FROM alpine:3.7
RUN apk update \
 && apk add --no-cache libtool build-base make automake autoconf git \
 && cd /tmp \
 && git clone https://github.com/twitter/twemproxy.git \
 && cd twemproxy \
 && git checkout v0.4.1 \
 && autoreconf -fvi \
 && ./configure --prefix=/ \
 && make -j2 \
 && make install

FROM alpine:3.7
COPY --from=0 /sbin/nutcracker /sbin/
COPY config.yml.default init.sh /

CMD [ "/init.sh" ]