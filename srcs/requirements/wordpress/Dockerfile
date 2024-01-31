FROM	debian:bullseye

RUN		apt-get update &&\
		apt-get -y install wget && \
		mkdir -p /var/www && \
		apt-get install -y php && \
		apt-get install -y php-fpm && \
		apt-get -y install php-mysql

RUN		wget https://wordpress.org/latest.tar.gz && \
		tar -xvf latest.tar.gz && \
		mv /wordpress/* /var/www && \
		chown -R www-data:www-data /var/www &&\
		rm -r /wordpress latest.tar.gz

RUN		sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf && \
		service php7.4-fpm restart

COPY ./tools/entry.sh /tmp/

RUN chmod +x /tmp/entry.sh

ENTRYPOINT [ "sh", "/tmp/entry.sh" ]