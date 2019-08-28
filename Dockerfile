FROM alpine:3.9 AS fetcher

ARG SCHXSLT_VERSION=v1.1

RUN apk add --no-cache unzip

RUN wget -q "https://github.com/Schematron/schematron/archive/master.zip" -O /schematron.zip  \
 && unzip -q /schematron.zip -d /tmp/schematron \
 && mkdir -p /files/iso-schematron/usr/share/xslt \
 && mv /tmp/schematron/$(ls /tmp/schematron/ | head -1)/trunk/schematron/code /files/iso-schematron/usr/share/xslt/iso-schematron

RUN wget -q "https://github.com/schxslt/schxslt/archive/${SCHXSLT_VERSION}.zip" -O /schxslt.zip \
 && unzip -q /schxslt.zip -d /tmp/schxslt \
 && mkdir -p /files/schxslt/usr/share/xslt \
 && mv /tmp/schxslt/$(ls /tmp/schxslt/ | head -1)/src/main/resources/xslt /files/schxslt/usr/share/xslt/schxslt

ADD files /files

RUN chmod a+x /files/*/bin/*


FROM scratch

COPY --from=fetcher /files /
