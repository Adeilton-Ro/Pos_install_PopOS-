#! /bin/bash

# Limpando Terminal
clear

# Voltando para o Diretorio inicial
cd ~

# Retirando possiveis travas do apt
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

echo "----------------------------"
echo "------Iniciando script------"
echo "----------------------------"

echo "------------------------------------------------"
echo "---Adicionando repositorios e instalando .deb---"
echo "------------------------------------------------"

# Ativando suporte para arquitetura 32BIT
sudo dpkg --add-architecture i386 

# Criando diretorio "TempFile" para por os .deb
mkdir -p ~/Downloads/TempFile

# indo para o Diretorio criado anteriormente
cd ~/Downloads/TempFile

# instalando o .deb do compilador C# e Hamachi
wget https://vpn.net/installers/logmein-hamachi_2.1.0.203-1_amd64.deb
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

# Executando os .deb
sudo dpkg -i *.deb

# Retornando ao diretorio Inicial
cd ~

# Removendo Diretorio "TempFile"
rm -fr ~/Downloads/TempFile

# Adicionando repositorio do Haguichi
sudo add-apt-repository -y ppa:webupd8team/haguichi -y

# Adicionando repositorio do GIT
sudo add-apt-repository ppa:git-core/ppa -y

# Baixando chave publica do Wine
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y

# Adicionando repositorio do Lutris
sudo add-apt-repository ppa:lutris-team/lutris -y

# Adicionando repositorio do Qbitorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y

# Atualizando repositorio do sistema
sudo apt update -y

echo "--------------------------------"
echo "---Instalando os repositorios---"
echo "--------------------------------"

# instalando pacotes snaps
sudo apt install snapd -y
# instalando VS CODE por snap
sudo snap install code --classic
# instalando Wine
sudo apt install --install-recommends winehq-stable -y
# instalando lutris
sudo apt install lutris -y
# instalando steam
sudo apt install steam -y
# instalando GIT
sudo apt install git -y
# instalando o DOTNET
sudo apt-get install -y apt-transport-https && \
sudo apt-get update && \
sudo apt-get install -y dotnet-sdk-3.1
# instalando compilador do c++
sudo apt install g++ -y
# instalando haguichi
sudo apt install haguichi -y
# instalando qbitorrent
sudo apt-get install qbittorrent -y
# instalando Java
sudo apt install default-jre -y
# instalando LAMP
sudo apt-get install lamp-server^ -y
# instalando phpadmin
sudo apt-get install phpmyadmin -y

# Reboot na maquina
printf "%s" 'Seu computador será reiniciado em '
for i in {5..1}
do
  printf "%s\b" $i
  sleep 1
done
reboot
