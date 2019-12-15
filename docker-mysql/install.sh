#!/bin/sh
# Script para:
# MySQL + Docker: executando uma instância e o mysql a partir de containers
# em um ambiente Raspbery Pi
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando Docker
# curl -sSL https://get.docker.com/ | sh

echo '+============================================================+'
echo '=== = =                                                = = ==='
echo '======== ===== -    DOCKERIZANDO MYSQL/RPI -    ===== ========'
echo '=== = =                                                = = ==='
echo '+============================================================+'

# Criando rede para executar o container
echo 'Digite o nome da sua rede docker mysql/pi: '
read name_network_container

echo 'Digite o nome do seu container docker mysql/pi: '
read name_container

echo 'Digite sua senha root mysql/pi: '
read password_root_mysql

echo 'Digite o numero da sua porta externa docker mysql/pi: '
read port_ex

echo 'Digite o nome do container da sua app dockerphpMyAdmin/pi: '
read name_container_app

echo 'Digite o numero da sua porta externa docker phpMyAdmin/pi: '
read port_ex_app

# Configurando serviço mysql no ambiente Raspbery Pi
mkdir -p /home/pi/.local/share/mysql
docker run --name $name_container -d -p $port_ex:3306 -v /home/pi/.local/share/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$password_root_mysql tobi312/rpi-mysql

# Configurando aplicação phpMyAdmin no ambiente Raspbery Pi
docker run -d --name $name_container_app --network $name_network_container -e PMA_HOST=$name_container -p $port_ex_app:80 phpmyadmin/phpmyadmin:edge

# recuperando acesso perdido do phpMyAdmin
curl -sSL https://raw.githubusercontent.com/rafaelspaesleme-ads/scripts-sh/master/instalador_env/env-server/recovery-pass-mysql.sh | sh
