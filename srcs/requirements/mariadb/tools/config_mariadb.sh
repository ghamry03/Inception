#!/bin/bash

mkdir -p /var/lib/mysql
mkdir -p /var/run/mysqld
touch /var/run/mysqld/mysqld.sock
touch /var/run/mysqld/mysqld.pid
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld/mysqld.sock
chown -R mysql:mysql /var/run/mysqld/mysqld.pid
chmod -R 755 /var/lib/mysql
chmod -R 755 /var/run/mysqld
chmod -R 755 /var/run/mysqld/mysqld.sock
chmod -R 755 /var/run/mysqld/mysqld.pid

service mariadb restart
echo -e "\ny\ny\n${MYSQL_ROOT_PASSWORD}\n${MYSQL_ROOT_PASSWORD}\ny\ny\ny\ny\n" | mysql_secure_installation
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE USER '${MYSQL_USER}'@'' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'';"
mysql -e "FLUSH PRIVILEGES;"

service mariadb restart

mysqld --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf
