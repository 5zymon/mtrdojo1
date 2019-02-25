FROM php:7.1.26-fpm-jessie

# Composer
# We need git for using composer
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip unzip zlib1g-dev \
    && docker-php-ext-install zip
RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN mv /var/www/html/composer.phar /usr/local/bin/composer
RUN chmod +X /usr/local/bin/composer

RUN groupadd --gid 1000 localgroup
RUN useradd -u 1000 localuser -g localgroup
RUN mkdir /home/localuser
RUN chown -R 1000:1000 /home/localuser

USER localuser

WORKDIR /app