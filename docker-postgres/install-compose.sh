#!/bin/sh
# Script para:
# PostgreSQL + Docker: RPI
# Execute esse script como root
# Create per Rafael Paes Leme

# Baixando imagem PostgreSQL RPI
docker pull tobi312/rpi-postgresql

# Configurando postgres
echo 'Digite o nome do container: '
read NAME_CONTAINER
echo 'Digite a senha do usuário postgres: '
read PASS_POSTGRES
echo 'Digite a porta externa do postgres: '
read PORT_EXT
echo 'Digite a versão do arquivo docker-compose: '
read VERSION_COMPOSE

docker-compose up --build -d
