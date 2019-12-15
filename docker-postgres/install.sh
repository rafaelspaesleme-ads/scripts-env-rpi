#!/bin/sh
# Script para:
# PostgreSQL + Docker: RPI
# Execute esse script como root
# Create per Rafael Paes Leme

# Configurando e instalando de forma tradicional
echo 'Digite o nome do container postgres: '
read name_container

echo 'Digite a porta externa do postgres: '
read port_ext

echo 'Digite a senha o usuario postgres: '
read password_pgsql

docker run --name $name_container -d -p $port_ext:5432 -v /home/pi/.local/share/postgresql:/var/lib/postgresql/data -e POSTGRES_PASSWORD=$password_pgsql tobi312/rpi-postgresql
