FROM alpine:latest

# https://archive.org/services/docs/api/internetarchive/installation.html

RUN apk update && apk upgrade \
    && apk add py-pip git bzip2

RUN pip install internetarchive

RUN mkdir /usr/local/data
RUN mkdir /usr/local/build
RUN mkdir /root/.config

COPY bin/wof-internet-archive /usr/bin/
COPY config/ia.ini /root/.config/