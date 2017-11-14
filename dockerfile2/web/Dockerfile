FROM php:7-apache

RUN usermod -u 1000 www-data \
  && groupmod -g 1000 www-data \
  && usermod -s /bin/bash www-data

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libmagickwand-dev \
        imagemagick \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i "s/\/var\/www\/html/\/var\/app\/web/g" /etc/apache2/sites-available/000-default.conf
RUN sed -i "s/\/var\/www/\/var\/app/g" /etc/apache2/apache2.conf
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

RUN a2enmod rewrite

RUN docker-php-ext-install pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN pecl install imagick \
    && docker-php-ext-enable imagick

RUN pecl install xdebug \
  && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_connect_back=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_host=ide.local" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_log=/tmp/php5-xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN echo "[Date]" > /usr/local/etc/php/conf.d/date.ini \
  && echo "date.timezone=Asia/Tokyo" >> /usr/local/etc/php/conf.d/date.ini \
  && echo "upload_max_filesize = 100M" > /usr/local/etc/php/conf.d/upload.ini \
  && echo "post_max_size = 200M" >> /usr/local/etc/php/conf.d/upload.ini

WORKDIR /var/app

EXPOSE 80
CMD ["apache2-foreground"]
