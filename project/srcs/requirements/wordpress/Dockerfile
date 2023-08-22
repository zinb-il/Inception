# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur wordpress


# Utilisation de l'image de base "alpine" avec la version "3.16"
FROM	alpine:3.15

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Installer php7 et tous ces outils nécessaires, worDocker Dumb-Init sans mettre 
# les sources en cache --> apk add --no-cache ngi
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade
RUN	apk update && apk upgrade && apk add --no-cache \
	dumb-init curl mariadb-client redis \
	php8 php8-phar php8-json php8-curl php8-fpm php8-mysqli php8-iconv\
	wget unzip \
	&& chmod +x /usr/bin/dumb-init \
	&& sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php8/php-fpm.d/www.conf \
	&& sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf \
	&& sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf \
	&& rm -f /var/cache/apk/* && mkdir -p /var/run/php



COPY	./requirements/wordpress/conf/wp-config.sh .
#RUN	sh wp-config.sh && rm wp-config.sh && chmod -R 0777 wp-content/
EXPOSE	9000

# Spécifier le répertoire /var/lib/mysql du conteneur comme volume,
# afin de monter des données externes dans le conteneur, ce qui est
# courament utilisé pour conserver les données de le base de données lors
# des démarrages des conteneurs

VOLUME	["/var/www"]

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD ["sh", "wp-config.sh"]

