#!/bin/bash

WP_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
WP_PATH="/var/www/html/wordpress/public_html"
WP="wp --allow-root --path=$WP_PATH"

chown -R www-data:www-data $WP_PATH && chmod -R 755 $WP_PATH

if [ ! -f "$WP_PATH/wp-config.php" ]
then

    wget $WP_URL
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    $WP core download

    $WP config create                                           \
        --dbname=wordpress                                      \
        --dbuser=${MYSQL_USER}                                  \
        --dbpass=${MYSQL_PASSWORD}                              \
        --dbhost=mariadb

    $WP core install --url=${DOMAIN_NAME} --title="Inception"   \
        --admin_user=${WORDPRESS_ADMIN_USER}                    \
        --admin_password=${WORDPRESS_ADMIN_PASSWORD}            \
        --admin_email=${WORDPRESS_ADMIN_EMAIL}

    $WP user create ${WORDPRESS_USER} ${WORDPRESS_EMAIL}        \
        --user_pass=${WORDPRESS_PASSWORD}                       \
        --role=author

    echo "file doesn't exists $WP_PATH/wp-config.php" >> test.txt
else
    echo "file exists $WP_PATH/wp-config.php" >> test.txt
fi

/usr/sbin/php-fpm7.3 -F -R --fpm-config /etc/php/7.3/fpm/pool.d/www.conf
