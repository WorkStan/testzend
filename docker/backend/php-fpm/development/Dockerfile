FROM php:7.4-fpm-alpine

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

RUN apk --update add wget \
  git \
  icu \
  curl \
  libpq-dev \
  libpng-dev \
  libxml2-dev \
  libzip-dev \
  icu-dev \
  zip \
  unzip

RUN rm /var/cache/apk/*

RUN docker-php-ext-configure intl

RUN docker-php-ext-install pdo pdo_mysql exif pcntl bcmath gd zip intl

RUN docker-php-ext-enable intl

WORKDIR /app
