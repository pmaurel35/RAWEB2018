#!/bin/sh
#
# by Cr 2007/2018
#
# Shell pour compiler le RAweb avec iRAbot.  
# Lancer le script dans le répertoire où se trouve les fichiers du rappport d'activité.
#
# Ce script utilise curl : http://curl.haxx.se/
# Pour windows utiliser gnutar ou zip à la place de tar : http://gnuwin32.sourceforge.net/packages.html
# Le rapport utilise MathML.
#
# Droit d'exécution :
# --------------------
# Si le message suivant apparait : 
# % ./irabot.sh: Permission non accordée
# lancer la commande suivante : 
# % chmod a+x ./irabot.sh

# Nouveauté 2016 : authentification avec le CAS Inria (https://cas.inria.fr/)

# Pour ne pas générer la version PDF du rapport : compilation 2 fois plus rapide 
#PDF="non"
# Compilation de la version PDF et la version HTML du rapport
PDF="oui"

# S'il existe un paramètre au lancement du script : génére seulement la version HTML
if [ $# -gt 0 ] 
then
PDF="non"
fi

if [ "$PDF" = "non" ]
then
PDF="-F pdf=non"
echo "\n> Génération de la version HTML du rapport (pas de version PDF)"
else
PDF=""
fi

# Création de l'archive
echo "\n> Création de l'archive\n"
tar cvfz projet.tar.gz *.tex */*.tex *.bib *.xml IMG
#sleep 1

# Chargement sur le serveur et réception du ficher de log
echo "\n> Transfert et compilation...\n"
curl --insecure -F uploaded_file=@projet.tar.gz $PDF -F 'button_name=Envoyer' https://irabot.inria.fr/compile/irabot > log.html
#sleep 1 

# Lancement navigateur avec le fichier de log
firefox log.html
echo "\n> Consulter le navigateur (fichier log.html)\n"
 
# 
# Documentation sur le RAweb : https://intranet.inria.fr/Vie-scientifique/Information-edition-scientifiques/RAweb/Rediger-le-RA-Objectifs-et-actualites
#
# En cas de problème : https://helpdesk.inria.fr/categories/181/submit
#
# En cas de problème : crossi@inrialpes.fr 
#

