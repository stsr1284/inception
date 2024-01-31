#!/bin/bash

sleep 10

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /run/php

cd /var/www

wp config create --allow-root --dbname=$_DATABASE --dbuser=$_USER --dbpass=$_PASSWORD --dbhost=$_HOST

wp core install --allow-root --path=/var/www \
								--url=donghakl.42.fr \
								--title=Inception \
								--admin_user=$ADMIN_USER \
								--admin_password=$ADMIN_PASSWORD \
								--admin_email=donghakl@student.42seoul.kr \
								--skip-email

wp user create \
							--allow-root --path=/var/www \
							$USER_ID user42@student.42seoul.kr \
							--role=author \
							--user_pass=$USER_PASSWORD

sleep 5
exec  php-fpm7.4 -F