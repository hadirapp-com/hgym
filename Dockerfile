FROM ramadhan/docker-php7.1-nginx-alpine

# Copy your Laravel project
COPY . /var/www/app

# Set the working directory
WORKDIR /var/www/app

RUN wget https://dl-cdn.alpinelinux.org/alpine/v3.6/community/x86_64/php7-pdo_sqlite-7.1.17-r0.apk && \
    apk add --allow-untrusted php7-pdo_sqlite-7.1.17-r0.apk

# optional pre config
# RUN php artisan key:generate && \
#     php artisan migrate:refresh && \
#     php artisan db:seed

# Expose port 80
EXPOSE 8008

# Start the application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8008"]