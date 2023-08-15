# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur nginx

# Utilisation de l'image de base "alpine" avec la version "3.18"
FROM	alpine:3.18

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update 
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade 
# Installer nginx sans mettre les sources en cache --> apk add --no-cache nginx
RUN	apk update && apk upgrade && apk add --no-cache nginx

# Définir le port d'écoute par défaut
EXPOSE	443

# Éxecuter la configuration installé
CMD	["nginx", "-g", "daemon off;"]
