FROM php:7.4-apache

# Install required extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    wget \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql zip \
    && apt-get clean

# Download MantisBT
WORKDIR /var/www/html
RUN wget https://sourceforge.net/projects/mantisbt/files/mantis-stable/2.25.7/mantisbt-2.25.7.tar.gz \
    && tar -xzf mantisbt-2.25.7.tar.gz --strip-components=1 \
    && rm mantisbt-2.25.7.tar.gz

# Copy pre-configured database settings
COPY config_inc.php /var/www/html/config/config_inc.php

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
