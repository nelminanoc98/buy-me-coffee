# Use an official Ubuntu image as the base
FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive
# Install necessary packages (e.g., nginx, PHP, MySQL client)
RUN apt-get update && \
    apt-get install -y nginx php-fpm php-mysql mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy your WordPress website files into the container
COPY . /var/www/html

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/sites-enabled/default

# Expose port
EXPOSE 80

# Start Nginx and PHP-FPM when the container starts
CMD service php8.1-fpm start && nginx -g "daemon off;"
