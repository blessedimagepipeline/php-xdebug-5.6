FROM appsvcbuildacr.azurecr.io/php:dev-5.6
LABEL maintainer="Azure App Services Container Images <appsvc-images@microsoft.com>"

RUN yes | pecl install xdebug-2.5.5 \
    && docker-php-ext-enable xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.profiler_output_dir=/home/LogFiles" >> /usr/local/etc/php/conf.d/xdebug.ini
