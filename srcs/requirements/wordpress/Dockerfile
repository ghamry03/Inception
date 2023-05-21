FROM debian:buster

ARG DOMAIN_NAME

RUN apt-get update  --no-install-recommends -y && \
    apt-get install php php-fpm mariadb-client php-mysql wget -y

RUN rm /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/php/7.3/fpm/pool.d/www.conf

COPY --chmod=755 ./tools/config_wp.sh /usr/local/bin/

ENTRYPOINT [ "config_wp.sh" ]
