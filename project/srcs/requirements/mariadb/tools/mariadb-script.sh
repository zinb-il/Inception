#!/bin/sh

/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
if [ ! -d /var/lib/mysql/${MYSQL_NAME} ]; then
	/usr/share/mariadb/mysql.server start
	mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
	mysql -e" CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
        mysql -e" GRANT ALL ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';"
	#mysql -e" ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	mysql -e" FLUSH PRIVILEGES;"
	mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown
fi
/usr/bin/mysqld_safe
