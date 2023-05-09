# wordpress Dockerfile
FROM debian:bullseye

ARG DOMAIN_NAME
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG WORDPRESS_ADMIN_USER
ARG WORDPRESS_ADMIN_PASSWORD
ARG WORDPRESS_ADMIN_EMAIL

RUN apt update && apt upgrade -y
RUN apt install php php-fpm mariadb-client php-mysql -y

RUN apt install wget -y
RUN apt install less -y

RUN mkdir -p /var/www/html/wordpress/public_html

RUN rm /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/php/7.4/fpm/pool.d/www.conf

RUN cd /var/www/html/wordpress/public_html;                                         \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar;                                                           \
    mv wp-cli.phar /usr/local/bin/wp;
#     wp core --allow-root download --path=/var/www/html/wordpress/public_html/       
#
# RUN wp --allow-root config create               \
#     --dbname=wordpress                          \
#     --dbuser=${MYSQL_USER}                      \
#     --dbpass=${MYSQL_PASSWORD}                  \
#     --dbhost=mariadb                            \
#     --path=/var/www/html/wordpress/public_html/
#
COPY ./tools/start_wordpress.sh /
RUN chmod +x /start_wordpress.sh
# RUN sed -i "s/MYSQL_USER/\'${MYSQL_USER}\'/" /var/www/html/wordpress/public_html/wp-config.php
# RUN sed -i "s/MYSQL_PASSWORD/\'${MYSQL_PASSWORD}\'/" /var/www/html/wordpress/public_html/wp-config.php

# # RUN wp user create ${WORDPRESS_ADMIN_USER} ${WORDPRESS_ADMIN_EMAIL} --role="administrator" --user_pass=$
# RUN wp --allow-root core install --url=${DOMAIN_NAME} --title="Inception"           \
#     --admin_user=${WORDPRESS_ADMIN_USER}                                            \
#     --admin_password=${WORDPRESS_ADMIN_PASSWORD}                                    \
#     --admin_email=${WORDPRESS_ADMIN_EMAIL}                                          \
#     --path=/var/www/html/wordpress/public_html/

ENTRYPOINT [ "/start_wordpress.sh" ]
# ENTRYPOINT [ "/usr/sbin/php-fpm7.4", "-F", "-R", "--fpm-config", "/etc/php/7.4/fpm/pool.d/www.conf" ]
