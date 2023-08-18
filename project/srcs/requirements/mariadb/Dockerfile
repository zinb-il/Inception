# Utilisation de l'image de base "alpine" avec la version "3.18"
FROM	alpine:3.18

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade
# Installer mariadb, mariadb-client et Docker Dumb-Init sans mettre 
# les sources en cache --> apk add --no-cache ngi
RUN	apk update && apk upgrade \ 
	&& apk add --no-cache mariadb mariadb-client dumb-init \
	&& chmod +x /usr/bin/dumb-init; \
	mkdir /var/run/mysqld; chmod 777 /var/run/mysqld;

# Définir le port d'écoute par défaut
EXPOSE	3306

# Copier les fichiers de configurartion et de la création de la base de données 
# de l'hote dans les répertoire du conteneur
COPY	requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf 
COPY	requirements/mariadb/tools/mariadb-script.sh /

# Spécifier le répertoire /var/lib/mysql du conteneur comme volume,
# afin de monter des données externes dans le conteneur, ce qui est
# courament utilisé pour conserver les données de le base de données lors
# des démarrages des conteneurs

VOLUME	"/var/lib/mysql"

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD ["sh", "mariadb-script.sh"]
