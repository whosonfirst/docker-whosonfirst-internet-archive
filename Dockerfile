FROM golang:1.12-alpine as gotools

RUN mkdir /build

RUN apk update && apk upgrade \
    && apk add git make gcc libc-dev \
    #
    && cd /build \
    && git clone https://github.com/whosonfirst/go-whosonfirst-github.git \
    && cd go-whosonfirst-github && make tools \
    && mv bin/wof-list-repos /usr/local/bin/ \    
    #
    && cd / && rm -rf build

FROM alpine

# https://archive.org/services/docs/api/internetarchive/installation.html

RUN apk update && apk upgrade \
    && apk add py-pip git bzip2 ca-certificates

RUN pip install internetarchive

RUN mkdir /usr/local/data
RUN mkdir /usr/local/build
RUN mkdir /etc/internetarchive

COPY --from=gotools /usr/local/bin/wof-list-repos /usr/local/bin/wof-list-repos

# SOMETHING SOMETHING SOMETHING CONFIGS...

COPY bin/wof-internet-archive /usr/bin/