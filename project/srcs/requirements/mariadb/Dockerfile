# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur mariadb

# Utilisation de l'image de base "alpine" avec la version "3.18"
FROM	alpine:3.18

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade
# Installer mariadb sans mettre les sources en cache --> apk add --no-cache nginx
RUN	apk update && apk upgrade && apk add --no-cache mariadb mariadb-client && \
	mkdir /var/run/mysql; chmod 777 /var/run/mysql; \
	{ #echo '[mysqld]'; \
	#echo 'skip-host-cache'; \
     	#echo 'skip-name-resolve'; \
     	echo 'bind-address=0.0.0.0'; } | \
	tee  /etc/my.cnf.d/docker.cnf; 
#   	sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf 
	&& mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Définir le port d'écoute par défaut
EXPOSE	3306

USER	mysql
COPY	tools/db.sh
ENTRYPOINT	["sh",  "db.sh"]

# Éxecuter la configuration installé
CMD	["/usr/bin/mysqld", "--skip-log-error"]
