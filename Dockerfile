# Updated to use PHP 8.3 LTS with official PHP Docker image
FROM php:8.3-cli

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions required by the project
RUN docker-php-ext-install \
    zip \
    dom \
    mbstring \
    xml \
    xmlwriter \
    bcmath

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Set working directory
WORKDIR /app

# By default, start PHP interactive shell
CMD ["php", "-a"]
