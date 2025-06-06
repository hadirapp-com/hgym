FROM ramadhan/docker-php7.1-nginx-alpine

# Copy your Laravel project
COPY . /var/www/app
COPY ./docker/php7/app.conf /etc/nginx/conf.d/app.conf

# Set the correct owner
RUN chown -R www-data:www-data /var/www/app

# Set the working directory
WORKDIR /var/www/app

# Change user
USER www-data

# optional pre config
# RUN php artisan key:generate && \
#     php artisan migrate:refresh && \
#     php artisan db:seed

# Expose port 80
EXPOSE 80