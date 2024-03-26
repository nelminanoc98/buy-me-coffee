FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y git nginx php-fpm php-mysql mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY . /var/www/html

COPY nginx.conf /etc/nginx/sites-enabled/default

WORKDIR /var/www/html

RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --no-dev \
    --prefer-dist

RUN chown -R www-data:www-data /var/www/html/wp-content

EXPOSE 80

CMD service php8.1-fpm start && nginx -g "daemon off;"
