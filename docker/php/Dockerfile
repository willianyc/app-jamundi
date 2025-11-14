FROM php:8.1.32-fpm

RUN apt-get update && apt-get install -y     git unzip zip libpng-dev libjpeg-dev libfreetype6-dev     libonig-dev libxml2-dev libzip-dev libicu-dev     && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg     && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install -j$(nproc) pdo_mysql mbstring exif pcntl bcmath zip intl

RUN docker-php-ext-install opcache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY ./docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini

WORKDIR /var/www/html
