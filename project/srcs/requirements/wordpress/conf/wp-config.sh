#!bin/sh

# Ce script permet d' installer wordpress 
# et le configurer via le ficher wp-config.php


echo "Debut de constuction de Wordpress"

until mysql --host=mariadb --user=$MYSQL_USER --password=$MYSQL_PASSWORD -e '\c'; do
  echo >&2 "Waiting until mariadb is created"
  sleep 1
done

rm wp-config.sh

cd /var/www/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /bin/wp && \
ln -s /usr/bin/php8 /usr/bin/php

wp core download --allow-root

wp config create --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
 
#wp config set WP_REDIS_HOST redis
#wp config set WP_REDIS_PORT 6379 --raw
#wp config set WP_REDIS_TIMEOUT 1
#wp config set WP_REDIS_READ_TIMEOUT 1
#wp config set WP_REDIS_DATABASE 0 

wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" \
--admin_user="$WP_ADMIN_USER" --admin_email="$WP_ADMIN_EMAIL" --admin_password="$WP_ADMIN_PASSWORD"

wp user create --porcelain \
    "$WP_AUTHOR_USER" "$WP_AUTHOR_EMAIL" --role=author --user_pass="$WP_AUTHOR_PASSWORD"

chmod -R 0777 wp-content/


/usr/sbin/php-fpm8 -F


echo "Fin de construction de wordpress"
