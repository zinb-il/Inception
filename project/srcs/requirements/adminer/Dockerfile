# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur adminer


# Adminer est une application Web offrant une interface graphique
# pour plusieurs systèmes de gestion de base de données, 
# réalisée en PHP et distribuée sous licence Apache

# Utilisation de l'image de base "alpine" avec la version "3.15"
FROM	alpine:3.15

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Installer VsFtpd et  Dumb-Init sans mettre 
# les sources en cache --> apk add --no-cache
RUN	apk update && apk upgrade && apk add --no-cache curl less mariadb-client \
    	php8 php8-common php8-session php8-iconv php8-gd php8-curl php8-xml php8-mysqli \
    	php8-imap php8-cgi php8-pdo php8-pdo_mysql php8-soap php8-posix php8-gettext \
    	php8-ldap php8-ctype php8-dom php8-simplexml wget dumb-init \
    	&& chmod +x /usr/bin/dumb-init \
	#&& sed -i "s|listen = 127.0.0.1:8080|listen = 0.0.0.0:8080|g" /etc/php8/php-fpm.d/www.conf \
	#&& sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf \
	#&& sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf \
	&& mkdir -p /var/run/php


# Copier le ficher de lancement du serveur VsFtpd
COPY	requirements/adminer/tools/adminer-script.sh /

# Définir dumb-init comme point d'entrée
EXPOSE	8080

# Définir le répertoire de travail
WORKDIR	["/var/www"]

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD ["sh", "/adminer-script.sh"]
