# wordpress Dockerfile
FROM debian:bullseye

ARG DOMAIN_NAME

RUN apt update && apt upgrade -y
RUN apt install php php-fpm mariadb-client php-mysql wget -y

RUN mkdir -p /var/www/html/wordpress/public_html

RUN rm /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/config_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config_wp.sh

ENTRYPOINT [ "config_wp.sh" ]
