FROM node:10.11-alpine

EXPOSE 8001

RUN apk update && \
    apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing vips-tools vips-dev fftw-dev gcc g++ make libc6-compat && \
    apk add git && \
    apk add python && \
    apk add yarn && \
    rm -rf /var/cache/apk/*

WORKDIR .

# src file
ADD ./index.js .
ADD ./package.json .

ENTRYPOINT yarn start
