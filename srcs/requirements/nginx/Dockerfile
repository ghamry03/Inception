FROM debian:buster

ARG INTRA_LOGIN

RUN apt-get update --no-install-recommends -y &&            \
    apt-get install nginx openssl -y 

RUN rm -rf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/*

RUN mkdir -p /etc/ssl/private
RUN chmod 700 /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096     \
        -keyout /etc/ssl/private/nginx-selfsigned.key       \
        -out /etc/ssl/certs/nginx-selfsigned.crt            \
        -subj "/C=AE/ST=Abu Dhabi/L=Abu Dhabi/O=42/OU=Abu Dhabi/CN=$INTRA_LOGIN"

COPY ./conf/ssl.conf /etc/nginx/conf.d

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
