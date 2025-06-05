FROM lucor/php7-cli:latest

# Copy your Laravel project
COPY . /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

RUN wget http://dl-cdn.alpinelinux.org/alpine/v3.6/community/x86_64/php7-fileinfo-7.1.17-r0.apk && \
    apk add --allow-untrusted php7-fileinfo-7.1.17-r0.apk && \
    touch storage/database.sqlite && \
    cp .env.example .env && \
    php artisan key:generate && \
    php artisan migrate:refresh && \
    php artisan db:seed

# Expose port 8008
EXPOSE 8008

# Start the application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8008"]