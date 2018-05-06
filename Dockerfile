FROM alpine:3.7

RUN apk add --update --no-cache build-base gcc wget git nodejs tzdata \
 && apk add --update --no-cache --virtual build-dependencies \
 && npm install -g vue-cli \
 && apk del build-dependencies \
 && mkdir /usr/app \
 && mkdir /usr/app/kojoshin_front

WORKDIR /usr/app/kojoshin_front

COPY package.json /usr/app/kojoshin_front
COPY package-lock.json /usr/app/kojoshin_front

RUN npm install
