# VagrantKubeLab
Código feito utilizando Vagrant para provisionar máquinas com KubeADM

# Introdução
O código consiste do arquivo principal que é o Vagrantfile, nele irá ser provisionado uma máquina considerada Master e duas Worker.

As máquinas irão utilizar um shell script que irá baixar o Docker e o KubeAdmin.

Na master é feita a configuração do KubeAdmin, jogada a saída da configuração para o arquivo join_cluster que irá ser utilizado pelos workers para lerem esse arquivo e finalizar a configação.

# Problemas conhecidos

1. No final do shell script do master a partir da linha 18 não está executando, ou seja: Não é habilitado o kubectl para o usuário padrão e também não é jogado a saída do comando para o arquivo join_cluster
