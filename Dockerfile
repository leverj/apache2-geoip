FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y ca-certificates apache2 libapache2-mod-geoip

COPY geoip.conf /etc/apache2/mods-available/
COPY 000-default.conf /etc/apache2/sites-enabled/
COPY favicon.ico /var/www/html/
RUN a2enmod proxy ssl proxy_http substitute headers rewrite geoip remoteip


EXPOSE 80 443

CMD apache2ctl -D FOREGROUND
