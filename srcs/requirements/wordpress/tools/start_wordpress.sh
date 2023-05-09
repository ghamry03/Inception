#!/bin/bash

WP="wp --allow-root --path=/var/www/html/wordpress/public_html"

chown -R www-data:www-data ./ && chmod -R 755 ./

$WP core download >> test.txt

$WP config create                               \
    --dbname=wordpress                          \
    --dbuser=${MYSQL_USER}                      \
    --dbpass=${MYSQL_PASSWORD}                  \
    --dbhost=mariadb >> test.txt                            \
    

$WP core install --url=${DOMAIN_NAME} --title="Inception"  \
    --admin_user=${WORDPRESS_ADMIN_USER}                   \
    --admin_password=${WORDPRESS_ADMIN_PASSWORD}           \
    --admin_email=${WORDPRESS_ADMIN_EMAIL} >> test.txt

/usr/sbin/php-fpm7.4 -F -R --fpm-config /etc/php/7.4/fpm/pool.d/www.conf



# bool eat( philo )
# while ( 1 )
#     if left fork available == true
#         while ( 1 )
#             if right forst available == true
#                 if (mysleep( time_to_eat ) == false)
#                     return false
#                 return true

# bool mysleep( philo_struct, sleep_time )
# current_time_of_the_day
# time_to_sleep
# var start_time = current_time_of_the_day = 200
# var current_time = start_time
# while (current_time < start time + time_to_sleep)
#     if check_death(philo_struct) == true
#         print dead
#         return false
#     current_time = get_time
#     usleep(200);
# return true
