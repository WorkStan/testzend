FROM php:7.4-cli-alpine

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

RUN addgroup -g 1000 app && adduser -u 1000 -G app -s /bin/sh -D app

COPY --from=composer:1.10.19 /usr/bin/composer /usr/local/bin/composer

WORKDIR /app

USER app
