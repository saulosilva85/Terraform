##                          INSTALAÇÃO TERRAFORM NO DEBIAN

Use os seguintes comandos para instalar os softwares necessários:
#### sudo apt-get update
#### sudo apt-get upgrade
#### sudo apt-get install vim
#### sudo apt-get install wget unzip

Crie uma pasta para salvar o download do terraform usando o seguite comando:
#### mkdir /downloads/terraform -p

Abra a pasta com o comando abaixo:
#### cd /downloads/terraform

Use o comando WGET para executar o download do terraform:
#### wget https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_linux_amd64.zip

Após finalizar o download do terraform, extraia o pacote de instalação usando o seguite comando:
#### unzip terraform_0.14.0_linux_amd64.zip

Instale o terraform com o comando abaixo:
#### sudo apt-get install terraform /usr/local/bin/
