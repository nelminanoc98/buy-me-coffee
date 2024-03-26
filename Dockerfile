FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y git nginx php-fpm php-mysql mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y curl gnupg && \
    echo "deb http://packages.cloud.google.com/apt gcsfuse-bionic main" | tee /etc/apt/sources.list.d/gcsfuse.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y gcsfuse

RUN touch gcs_key.json
RUN echo "$GCS_FUSE_KEY" > gcs_key.json

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
