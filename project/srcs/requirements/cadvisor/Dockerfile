# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur cadvisor

# cAdvisor (Container Advisor) permet aux utilisateurs d'observer l'utilisation 
# des ressources et les performances de leurs conteneurs en cours d'exécution


# Utilisation de l'image de base "alpine" avec la version "3.15"
FROM	alpine:3.15



# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update 
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade 
# Installer cadvisor
RUN	apk update && apk upgrade && apk add --no-cache ca-certificates \
	libc6-compat dumb-init wget \
	&& chmod +x /usr/bin/dumb-init \
	&& wget https://github.com/google/cadvisor/releases/download/v0.41.0/cadvisor -O /usr/bin/cadvisor \
	&& chmod +x /usr/bin/cadvisor


# Définir le port d'écoute par défaut
EXPOSE	5000

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD ["/usr/bin/cadvisor","-port=5000"]
