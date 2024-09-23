#!/usr/bin/env bash
echo "Atualizando pacotes e instalando Apache..."
yum update -y
yum install -y httpd

# Verifica se o diretório /vagrant/html existe antes de copiar os arquivos
if [ -d "/vagrant/html" ]; then
    echo "Copiando arquivos HTML..."
    cp -r /vagrant/html/* /var/www/html/
else
    echo "/vagrant/html não encontrado. Verifique se os arquivos estão na pasta compartilhada."
fi

# Inicia o Apache e o configura para iniciar automaticamente
echo "Iniciando Apache..."
systemctl start httpd
systemctl enable httpd

# Verifica se o Apache está rodando
if systemctl status httpd | grep -q running; then
    echo "Apache instalado e rodando com sucesso!"
else
    echo "Houve um problema ao iniciar o Apache."
fi

