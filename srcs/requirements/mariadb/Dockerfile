# mariadb Dockerfile
FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

RUN chown -R mysql:mysql /var/lib/mysql && \ 
    service mysql restart && \
    echo -e "\ny\ny\n${MYSQL_ROOT_PASSWORD}\n${MYSQL_ROOT_PASSWORD}\ny\ny\ny\ny\n" | mysql_secure_installation && \
    mysql -e "CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; \
    CREATE USER '${MYSQL_USER}'@'' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@''; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
    FLUSH PRIVILEGES;" && \
    service mysql restart

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf" ]
