# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur VsFtpd


# VsFTPd (Very Secure FTP Daemon), créé en 2000, est un serveur FTP 
# qui mise beaucoup sur la sécurité développé par Chris Evans

# Utilisation de l'image de base "alpine" avec la version "3.15"
FROM	alpine:3.15

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Installer VsFtpd et  Dumb-Init sans mettre 
# les sources en cache --> apk add --no-cache
RUN apk update && apk upgrade && apk add --no-cache \
    dumb-init vsftpd \
    && chmod +x /usr/bin/dumb-init 

# Copier le ficher de lancement du serveur VsFtpd
COPY requirements/ftp/tools/vsftpd-script.sh /

# Définir dumb-init comme point d'entrée
EXPOSE	21

# Définir le répertoire de travail
WORKDIR "/var/www"

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD ["sh", "/vsftpd-script.sh"]
