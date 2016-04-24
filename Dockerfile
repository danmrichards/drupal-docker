FROM alpine:3.3
MAINTAINER Dan Richards <dan.m.richards@gmail.com>

# Install NGINX and PHP.
RUN apk update \
    && apk add bash curl git nginx ca-certificates \
    php-ctype php-fpm php-json php-zlib php-xml php-pdo php-phar php-openssl \
    php-pdo_mysql php-mysqli \
    php-gd php-iconv php-mcrypt musl

# Clean up after package installation.
RUN rm -rf /var/cache/apk/*

# Install Composer.
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

# Install Drush.
RUN curl -O http://files.drush.org/drush.phar
RUN mv drush.phar /usr/local/bin/drush && chmod +x /usr/local/bin/drush

# Install Drupal Console.
RUN curl http://drupalconsole.com/installer -L -o drupal.phar
RUN mv drupal.phar /usr/local/bin/drupal && chmod +x /usr/local/bin/drupal
RUN drupal init --override && drupal check

# Add the config files for NGINX and PHP.
ADD conf/nginx.conf /etc/nginx/
ADD conf/php-fpm.conf /etc/php/
ADD scripts/start.sh /
RUN chmod +x /start.sh

EXPOSE 8000
VOLUME ["/opt"]

CMD ["/start.sh"]
