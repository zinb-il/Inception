# Ce fichier Dockerfile est destiné à la création d'une image pour un conteneur Redis


# Redis : qui signifie Remote Dictionary Server (serveur de dictionnaires à distance), \
# est un magasin de données clé-valeur en mémoire, rapide et open-source, \
# qui peut être utilisé comme base de données, cache, courtier de messages et file d'attente.


# Utilisation de l'image de base "alpine" avec la version "3.15"
FROM	alpine:3.15

# Demander au gestionnaire de fichiers apk de mettre à jour sa liste de dépôts --> apk update
# Installer redis Dumb-Init sans mettre 
# les sources en cache --> apk add --no-cache dumb-init redis
# Mettre à jour les paquets obsolètes dans notre environnement --> apk upgrade
# Annulation de  la liaison par défaut à localhost,en permettant à Redis d'accepter
# des connexions à partir de n'importe quelle adresse IP 
# --> sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf
# Fixer la quantité maximale de mémoire que Redis peut utiliser à 20 mégaoctets
# --> sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g
RUN	apk update && apk upgrade && apk add --no-cache \
	dumb-init redis \
	&& chmod +x /usr/bin/dumb-init \
	&& sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis.conf \
    	&& sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g"  /etc/redis.conf \
	&& echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf


# Définir dumb-init comme point d'entrée
EXPOSE	6379

# Définir dumb-init comme point d'entrée
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Éxecuter la configuration installé
CMD ["redis-server", "/etc/redis.conf"]

