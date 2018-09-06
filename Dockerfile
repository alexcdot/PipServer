FROM alpine:3.7
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

RUN apk update && \
    apk add py-pip && \
    pip install --upgrade pip && \
    mkdir -p /srv/pypi

RUN pip install -U passlib pypiserver[cache]==1.2.1

COPY ./pyps /srv/pypi

CMD /usr/bin/pypi-server --port 8080 /srv/pypi
