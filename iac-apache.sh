#!/bin/bash

echo "Atualizando repositório APT..."
apt-get update -y
apt-get upgrade -y

echo "Instalando servidor Apache..."
apt-get install apache2 -y

echo "Instalando unzip..."
if [ -z $(unzip) ]; then
	apt-get install unzip -y
else
	echo "Unzip já instalado"
fi

echo "Download aplicação..."
URL="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/"
FILE="main.zip"
PROJECT="linux-site-dio-main"

cd /tmp
wget -c $URL/$FILE
unzip $FILE
cp -R $PROJECT/* /var/www/html

echo "Verificando projeto"
curl http://localhost/index.html
