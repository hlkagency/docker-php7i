FROM php:7-fpm-alpine

# Environments
ENV TIMEZONE            America/Chicago

RUN apk add --update tzdata && \
  cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
  echo "${TIMEZONE}" > /etc/timezone && \
  docker-php-ext-install mysqli && \
  apk del tzdata && \
  rm -rf /var/cache/apk/*
