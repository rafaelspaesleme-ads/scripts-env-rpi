#!/bin/sh
# Script para:
# MySQL + Docker: instalação do docker em um ambiente rapsberry pi.
# Execute esse script como root
# Create per Rafael Paes Leme

# instalando pré-requisitos do sistema
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y

# instalando docker
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

# configurando usuario docker
sudo usermod -aG docker $USER

# Importando chave CPG do Docker
sudo curl https://download.docker.com/linux/raspbian/gpg

# Configurando repositorio docker 
echo "deb https://download.docker.com/linux/raspbian/ stretch stable" >> /etc/apt/sources.list

# atualizações do sistema
apt-get update
apt-get upgrade

# startando serviço docker
systemctl start docker.service

# informações
docker info
