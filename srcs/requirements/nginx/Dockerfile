# nginx Dockerfile
FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install nginx -y 
RUN apt install openssl -y 

RUN rm -rf /etc/nginx/sites-available/*
RUN rm -rf /etc/nginx/sites-enabled/*

RUN mkdir -p /etc/ssl/private
RUN chmod 700 /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096\
        -keyout /etc/ssl/private/nginx-selfsigned.key       \
        -out /etc/ssl/certs/nginx-selfsigned.crt            \
        -subj "/C=AE/ST=Abu Dhabi/L=Abu Dhabi/O=42/OU=Abu Dhabi/CN=ommohame"

COPY ./conf/ssl.conf /etc/nginx/conf.d

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
