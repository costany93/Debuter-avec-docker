# tous ve qui est ecrit dans ce fichier DockerFile est fait pour pouvoir construire notre image docker


#ici on specifie l'instance du packagge de programmation a utilisé dans notre cas c'est node(packkage officiel ddisponible sur docker)
FROM node 

#ici on va dire a docker d'executer toutes nos commandes dans le dossier /app que nous allons créer plutot que le dossier racine qui est .

WORKDIR /app

# pour des raisons de performance nous allons copier nos fichier de dependances avons nos fichiers/dossiers du projet
#pourquoi car il faut savoir que docker garde en cache les instructions de chaque build et si on ne copie pas le package.json avons de run nous allons a chaque build lancer un npm install alors que nous avons peut etre meme pas modifier notre fichier de dependances

COPY package.json /app

#ici on dit a docker d'executer les commandes suivantes dans notre container

RUN npm install

#ici on copy toutes notre application en local(tous les fichiers et dossiers en utilisant .) dans notre image docker
#donc tout notre projet sera copier dans le /app dans notre image docker
COPY . /app


#par defaut docker lance ces environement dans son propre reseau interne qui n'est pas relié a notre machine et comme notre projet fonctionne sur le port 80 de notre image on specifie ici a docker de pouvoir fusionner avec notre machine local afin qu'on ai acces au port 80 de notre container docker

EXPOSE 80

# ici nous allons executer la commande CMD qui sera executer lorsque notre container sera lancer par rapport a notre image créer su dessus

CMD ["node", "server.js"]

# a savoir que lorsque nous avons build une image docker, ils copies les elements de notre projet dans cette image docker du coup si nous faisant des modifications dans notre projet il va falloir a nouveau build afin que notre iamge docker et notre projet soit a jour





