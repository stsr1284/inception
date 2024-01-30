#!/bin/bash

mv /wordpress/* /var/www/
chown -R www-data:www-data /var/www
mv /wp-config.php /var/www/
rm -r /wordpress latest.tar.gz
sleep 13

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /run/php

cd /var/www

wp core install --allow-root --path=/var/www \
								--url=donghakl.42.fr \
								--title=Inception \
								--admin_user=$ADMIN_USER \
								--admin_password=$ADMIN_PASSWORD \
								--admin_email=donghakl@student.42seoul.kr \
								--skip-email

wp user create \
							$USER_ID user42@student.42seoul.kr \
							--allow-root --path=/var/www \
							--role=author \
							--user_pass=$USER_PASSWORD

sleep 5
exec  php-fpm7.4 -F