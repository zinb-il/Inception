#!bin/sh

# Ce script permet de créer un fichier 
# de configuration WordPress (wp-config.php)

if [ ! -f "/var/www/wp-config.php" ]; then
	touch /var/www/wp-config.php
	echo "define( 'DB_NAME', '${DB_NAME}' );" >> /var/www/wp-config.php
	echo "define( 'DB_USER', '${DB_USER}' );" >> /var/www/wp-config.php
	echo "define( 'DB_PASSWORD', '${DB_PASS}' );" >> /var/www/wp-config.php
	echo "define( 'DB_HOST', 'mariadb' );" >> /var/www/wp-config.php
	echo "define( 'DB_CHARSET', 'utf8' );" >> /var/www/wp-config.php
	echo "define( 'DB_COLLATE', '' );" >> /var/www/wp-config.php
	echo "define('FS_METHOD','direct');" >> /var/www/wp-config.php
	echo "\$table_prefix = 'wp_';" >> /var/www/wp-config.php
	echo "define( 'WP_DEBUG', false );" >> /var/www/wp-config.php
	echo "if ( ! defined( 'ABSPATH' ) ) {" >> /var/www/wp-config.php
	echo "define( 'ABSPATH', __DIR__ . '/' );}" >> /var/www/wp-config.php
	echo "define( 'WP_REDIS_HOST', 'redis' );" >> /var/www/wp-config.php
	echo "define( 'WP_REDIS_PORT', 6379 );" >> /var/www/wp-config.php
	echo "define( 'WP_REDIS_TIMEOUT', 1 );" >> /var/www/wp-config.php
	echo "define( 'WP_REDIS_READ_TIMEOUT', 1 );" >> /var/www/wp-config.php
	echo "define( 'WP_REDIS_DATABASE', 0 );" >> /var/www/wp-config.php
	echo "require_once ABSPATH . 'wp-settings.php';" >> /var/www/wp-config.php
fi
