FROM python:3.7.0-alpine3.8

MAINTAINER Maxsuel Marinho <maxsuelmarinho@gmail.com>

RUN apk update && \
    apk add --no-cache \
        build-base \
        python3-dev \
        libffi-dev \
        libressl-dev \
        gcc \
        linux-headers \
        ca-certificates

RUN pip install moto[server]

EXPOSE 4576

ENTRYPOINT ["moto_server", "sqs", "-H", "0.0.0.0", "-p", "4576"]
