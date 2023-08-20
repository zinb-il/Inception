# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur wordpress


# Utilisation de l'image de base "alpine" avec la version "3.18"
FROM	alpine:3.18

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Installer php8 et tous ces outils nécessaires, worDocker Dumb-Init sans mettre 
# les sources en cache --> apk add --no-cache ngi
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade
RUN	apk update && apk upgrade  && apk add --no-cache \
	dumb-init curl less mariadb mariadb-client php-cli php \
	php-fpm php-mysqli php-json php-curl php-dom php-exif \
	php-fileinfo php-mbstring php-openssl php-xml php-zip wget unzip \
	&& chmod +x /usr/bin/dumb-init \
	#&& sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/php-fpm.d/www.conf \
	#&& sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php/php-fpm.d/www.conf \
	#&& sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php/php-fpm.d/www.conf \
	&& rm -f /var/cache/apk/*

WORKDIR	/var/www
RUN	wget https://wordpress.org/latest.zip && unzip latest.zip && \
	cp -rf wordpress/* . && rm -rf wordpress latest.zip
COPY	./requirements/wordpress/conf/wp-config.sh .
RUN	sh wp-config.sh && rm wp-config.sh && chmod -R 0777 wp-content/


# Spécifier le répertoire /var/lib/mysql du conteneur comme volume,
# afin de monter des données externes dans le conteneur, ce qui est
# courament utilisé pour conserver les données de le base de données lors
# des démarrages des conteneurs

VOLUME	"/var/www"

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD ["/usr/sbin/php-fpm8", "-F"]
