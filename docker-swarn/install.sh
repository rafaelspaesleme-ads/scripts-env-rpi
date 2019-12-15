
#!/bin/sh
# Script para:
# MySQL + Docker: instalação do docker swarn em um ambiente rapsberry pi.
# Execute esse script como root
# Create per Rafael Paes Leme

# inicialize o Docker Swarn em seu dispositivo nó mestre com o docker instalado
echo 'Digite o ip do seu dispositivo principal:'
read ip_principal
docker swarm init --advertise-addr $ip_principal


# Verificar os nodes criados em meu cluster
docker node ls

# levantando meu container em forma de um serviço no docekr swarn
echo 'Digite um nome para meu cluster: '
read name_cluster
echo 'Digite a porta externa do serviço: '
read port_ext
echo 'Digite a porta interna do serviço: (porta da aplicação)'
read port_int
echo 'Digite o o seu nome de usuário docker: '
read user_docker
echo 'Digite o nome da imagem docker da sua aplicação: '
read image_docker
echo 'Digite a versão da sua imagem, da qual deseja utilizar: '
read version_image_docker

docker service create --name $name_cluster --publish $port_ext:$port_int/tcp --constraint node.role==manager --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock $user_docker/$image_docker:$version_image_docker
