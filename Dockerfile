FROM alpine:3.9 AS fetcher

ARG SCHXSLT_VERSION=v1.1

ADD files /files

RUN apk add --no-cache unzip

RUN wget -q "https://github.com/Schematron/schematron/archive/master.zip" -O /schematron.zip  \
 && unzip -q /schematron.zip -d /tmp/schematron \
 && mkdir -p /files/iso-schematron/scripts \
 && mv /tmp/schematron/$(ls /tmp/schematron/ | head -1)/trunk/schematron/code /files/iso-schematron/scripts/iso-schematron

RUN wget -q "https://github.com/schxslt/schxslt/archive/${SCHXSLT_VERSION}.zip" -O /schxslt.zip \
 && unzip -q /schxslt.zip -d /tmp/schxslt \
 && mkdir -p /files/schxslt/scripts \
 && mv /tmp/schxslt/$(ls /tmp/schxslt/ | head -1)/src/main/resources/xslt /files/schxslt/scripts/schxslt

RUN chmod a+x /files/*/bin/*


FROM scratch

COPY --from=fetcher /files /
