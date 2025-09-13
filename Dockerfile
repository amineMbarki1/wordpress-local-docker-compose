FROM php:8.2-fpm
RUN docker-php-ext-install mysqli 
RUN apt update -y
RUN apt install procps -y
RUN pecl install xdebug; \
    docker-php-ext-enable xdebug
RUN umask 000

# curl exif fileinfo hash imagick mbstring openssl pdo_mysql xml zip