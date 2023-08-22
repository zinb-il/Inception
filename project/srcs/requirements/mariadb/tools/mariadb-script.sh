#!/bin/sh

echo "Début de construction de Mariadb"

usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
if [ ! -d /var/lib/mysql/wordpress ]; then
	/usr/share/mariadb/mysql.server start
	mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
	mysql -e" CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
        mysql -e" GRANT ALL ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';"
	mysql -e" FLUSH PRIVILEGES;"
	mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown
fi
echo "Fin de construction Mariadb"
/usr/bin/mysqld_safe
