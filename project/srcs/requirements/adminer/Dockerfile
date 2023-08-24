# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur adminer


# Adminer est une application Web offrant une interface graphique
# pour plusieurs systèmes de gestion de base de données, 
# réalisée en PHP et distribuée sous licence Apache

# Utilisation de l'image de base "alpine" avec la version "3.15"
FROM	alpine:3.15

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Installer PHP et  Dumb-Init sans mettre 
# les sources en cache --> apk add --no-cache
RUN	apk update && apk upgrade && apk add --no-cache \
        php8 php8-common php8-session php8-iconv php8-gd php8-curl \
        php8-xml php8-mysqli php8-imap php8-cgi php8-pdo \
        php8-pdo_mysql php8-soap php8-posix php8-gettext php8-ldap \
        php8-ctype php8-dom php8-simplexml wget \
	&& rm -f /var/cache/apk/* && mkdir -p /var/run/php


# Définir le répertoire de travail
WORKDIR	/var/www

# Télécharger Adminer
# Donner à l'utilisateur root le contrôle total du contenu du répertoire /var/www/
RUN	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    	mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

# Définir dumb-init comme point d'entrée
EXPOSE	8080

# Éxecuter la configuration installé
CMD	[ "php8", "-S", "[::]:8080", "-t", "/var/www" ]
