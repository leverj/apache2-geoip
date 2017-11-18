FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y ca-certificates apache2

COPY 000-default.conf /etc/apache2/sites-enabled/
COPY favicon.ico /var/www/html/
RUN a2enmod proxy ssl proxy_http substitute headers


EXPOSE 80 443

CMD apache2ctl -D FOREGROUND
