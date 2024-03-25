# Use an official Ubuntu image as the base
FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive
# Install necessary packages (e.g., nginx, PHP, MySQL client)
RUN apt-get update && \
    apt-get install -y git nginx php-fpm php-mysql mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY composer.json composer.lock ./
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Verify Composer installation
RUN composer --version

RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --no-dev \
    --prefer-dist
# Copy your WordPress website files into the container
COPY .env /var/www/html/.env
COPY . /var/www/html

RUN cat /var/www/html/.env

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/sites-enabled/default

# Expose port
EXPOSE 80

# Start Nginx and PHP-FPM when the container starts
CMD service php8.1-fpm start && nginx -g "daemon off;"
