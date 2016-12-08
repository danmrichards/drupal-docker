FROM alpine:3.3
MAINTAINER Dan Richards <dan.m.richards@gmail.com>

# Install NGINX and PHP.
RUN apk add --no-cache bash curl git mysql-client nginx ca-certificates \
    php-ctype php-curl php-dom php-fpm php-gd php-iconv php-json php-mysqli \
    php-openssl php-phar php-pdo php-pdo_mysql php-mcrypt php-opcache php-soap \
    php-xml php-zlib musl

# Install Composer.
RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

# Install Drush.
RUN curl -O http://files.drush.org/drush.phar \
    && mv drush.phar /usr/local/bin/drush \
    && chmod +x /usr/local/bin/drush

# Install Drupal Console.
RUN curl http://drupalconsole.com/installer -L -o drupal.phar \
    && mv drupal.phar /usr/local/bin/drupal \
    && chmod +x /usr/local/bin/drupal \
    && drupal init --override --no-interaction && drupal check

# Add the config files for NGINX and PHP.
ADD conf/nginx.conf /etc/nginx/
ADD conf/php-fpm.conf /etc/php/
ADD scripts/start.sh /
RUN chmod +x /start.sh

EXPOSE 8000
VOLUME ["/opt"]

CMD ["/start.sh"]
