#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Practica Vagrant</title></head>
<body>
    <h1>¡Bienvenido a la página de apache!</h1>
    <p><strong>Nombre:</strong>Francisco Javier Díaz Garrón</p>
    <p><strong>Hostname:</strong> $(hostname)</p>
</body>
</html>
EOF