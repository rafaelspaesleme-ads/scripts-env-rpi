
#!/bin/sh
# Script para:
# Docker: Acoplando os nós do cluster com Raspberry Pi.
# Execute esse script como root
# Create per Rafael Paes Leme

# acessando node desejado
echo 'Digite o ip do nó principal: '
read ip_principal
echo 'Digite a porta do nó principal: '
read port_principal

echo 'Informe o token do nó principal: '
read token

docker swarm join --token $token $ip_principal:$port_principal
