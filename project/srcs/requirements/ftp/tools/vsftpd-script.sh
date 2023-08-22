#!/bin/sh

echo "Début de construction de VsFtpd"

# Créer un utilisateur pour se connecter au serveur, et l'ajouter dans 
# le groupe sudo, pour qu'il puisse fodifer les fichier
    adduser -h /var/www -s /bin/false -D ${FTP_USER} && \
    echo "${FTP_USER}:${FTP_PASSWORD}" | /usr/sbin/chpasswd && \
    adduser ${FTP_USER} root


# Configurer correctement le fichier de configuration - décommenter 
# les paramètres dont nous avons besoin et ajouter ceux qui manquent
   sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf && \
   sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
   sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
   sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf
   echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
   echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
   echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf

# Lancer VsFTpd en mode foreground
   /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

echo "Fin de construction VsFtpd"

