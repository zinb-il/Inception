#!/bin/sh

echo "Début de construction de Adminer"

# Télécharger Adminer
# Donner à l'utilisateur root le contrôle total du contenu du répertoire /var/www/
   wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
   mv adminer-4.8.1.php index.php

# Lancer Adminer en mode foreground
   #/usr/sbin/php-fpm8 -F
   php -S 0.0.0.0:8080 -t /var/www

echo "Fin de construction Adminer"

