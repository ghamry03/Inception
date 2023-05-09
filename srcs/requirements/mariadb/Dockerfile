# mariadb Dockerfile
FROM debian:bullseye

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/lib/mysql
RUN mkdir -p /var/run/mysqld
RUN mkdir -p /shared/database
RUN touch /var/run/mysqld/mysqld.sock
RUN touch /var/run/mysqld/mysqld.pid
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld/mysqld.sock
RUN chown -R mysql:mysql /var/run/mysqld/mysqld.pid
RUN chmod -R 777 /var/lib/mysql
RUN chmod -R 777 /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld/mysqld.sock
RUN chmod -R 777 /var/run/mysqld/mysqld.pid
RUN chmod -R 777 /shared/database
RUN chown -R mysql:mysql /shared/

RUN service mariadb restart; \
    echo -e "\ny\ny\n${MYSQL_ROOT_PASSWORD}\n${MYSQL_ROOT_PASSWORD}\ny\ny\ny\ny\n" | mysql_secure_installation; \
    mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" \
    mysql -e "CREATE USER '${MYSQL_USER}'@'' IDENTIFIED BY '${MYSQL_PASSWORD}';"; \
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'';"; \
    mysql -e "FLUSH PRIVILEGES;"

RUN service mariadb restart

ENTRYPOINT [ "mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf" ]
