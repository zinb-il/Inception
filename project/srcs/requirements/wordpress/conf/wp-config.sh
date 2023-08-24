#!bin/sh

# Ce script permet d' installer wordpress 
# et le configurer via le ficher wp-config.php


echo "Début de constuction de Wordpress"

#Attendre que le conteneur maria db soit créé
until mysql --host=mariadb --user=$MYSQL_USER --password=$MYSQL_PASSWORD -e '\c'; do
  echo >&2 "Waiting until mariadb is created"
  sleep 2
done


cd /var/www/


# Installation et configurartion du WP-CIL
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /bin/wp && \
ln -s /usr/bin/php8 /usr/bin/php

# Telechargement des fichiers wordpress
wp core download --allow-root
wp config create --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
 

# Création du deux utilisateurs un est un admin et l'autre un auteur
wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" \
--admin_user="$WP_ADMIN_USER" --admin_email="$WP_ADMIN_EMAIL" --admin_password="$WP_ADMIN_PASSWORD"
wp user create \
    "$WP_AUTHOR_USER" "$WP_AUTHOR_EMAIL" --role=author --user_pass="$WP_AUTHOR_PASSWORD"


# Téléchargement et activation du thème Twenty twenty two
wp theme install twentytwentytwo --activate


# Téléchargement et activation du pluguin WP-Redis
wp plugin install wp-redis --activate


# Activation du Redis et modification dans le fichier de configuration
wp redis enable
wp config set WP_REDIS_HOST ${WP_REDIS_HOST}
wp config set WP_REDIS_PORT ${WP_REDIS_PORT}
wp config set WP_REDIS_TIMEOUT ${WP_REDIS_TIMEOUT}
wp config set WP_REDIS_READ_TIMEOUT ${WP_REDIS_READ_TIMEOUT}
wp config set WP_REDIS_DATABASE ${WP_REDIS_DATABASE} 
wp config set WP_CACHE ${WP_CACHE}

chmod -R 0777 wp-content/

# Lancer PhP FastCgi en mode foreground
/usr/sbin/php-fpm8 -F

echo "Fin de construction de wordpress"
