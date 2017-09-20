FROM debian:jessie

RUN apt-get update && \
    apt-get install supervisor -y 

ENV PHP_VERSION 5

RUN apt-get update && \
	apt-get install -y php5-cli php5-fpm php5-curl php5-gd php5-mcrypt
RUN apt-get install -y php5-mysql

ADD config/ /etc/php5/fpm/
ADD config/supervisor-php5-fpm.conf /etc/supervisor/conf.d/php-fpm.conf

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
