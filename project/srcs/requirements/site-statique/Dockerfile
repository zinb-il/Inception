# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur d'un site statique

# Utilisation de l'image de base "alpine" avec la version "3.15"
FROM	alpine:3.15

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update 
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade 
# Installer nginx et Docker Dumb-Init sans mettre les sources en cache --> apk add --no-cache nginx
RUN	apk update && apk upgrade && apk add --no-cache nginx dumb-init \
	&& chmod +x /usr/bin/dumb-init

# Définir le port d'écoute par défaut
EXPOSE	444

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD	["nginx", "-g", "daemon off;"]

