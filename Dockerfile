FROM php:8.2-fpm
RUN docker-php-ext-install mysqli 
RUN apt update -y
RUN apt install procps -y

RUN pecl install xdebug; \
    docker-php-ext-enable xdebug


RUN pecl install apcu; \
    docker-php-ext-enable apcu


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
# curl exif fileinfo hash imagick mbstring openssl pdo_mysql xml zip