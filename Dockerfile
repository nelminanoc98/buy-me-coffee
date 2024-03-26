FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl lsb-release git nginx php-fpm php-mysql mysql-client gnupg gnupg1 gnupg2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` \
    && echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

RUN apt-get update
RUN apt-get install -y gcsfuse
RUN touch gcs_key.json
RUN echo "$GCS_FUSE_KEY" > gcs_key.json

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY . /var/www/html

COPY nginx.conf /etc/nginx/sites-enabled/default
RUN chown -R www-data:www-data /var/www/html/wp-content

WORKDIR /var/www/html

RUN mkdir /mnt/gcs
RUN gcsfuse --key-file /gcs_key.json buy-me-coffee-public /mnt/gcs

RUN mv /var/www/html/wp-content /var/www/html/wp-content-backup
RUN ln -s /mnt/gcs /var/www/html/wp-content
RUN cp -R /var/www/html/wp-content-backup/* /var/www/html/wp-content/

RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --no-dev \
    --prefer-dist

EXPOSE 80

CMD service php8.1-fpm start && nginx -g "daemon off;"
