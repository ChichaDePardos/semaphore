#!/bin/bash

set -e

USERNAME="ansible"
PASSWORD="M0nsoon,@"

# Verifica si el usuario ya existe
if id "$USERNAME" &>/dev/null; then
    echo "El usuario '$USERNAME' ya existe. Saliendo..."
    exit 1
fi

echo "[+] Creando usuario '$USERNAME'..."

# Crea el usuario con directorio home y bash shell
useradd -m -s /bin/bash "$USERNAME"

# Establece la contraseña
echo "${USERNAME}:${PASSWORD}" | chpasswd

# Añade a grupo sudo
usermod -aG sudo "$USERNAME"

echo "[+] Configurando sudo sin contraseña (opcional)..."
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/90-$USERNAME"
chmod 0440 "/etc/sudoers.d/90-$USERNAME"

# Crea el directorio .ssh
echo "[+] Creando ~/.ssh para $USERNAME..."
mkdir -p /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
chown $USERNAME:$USERNAME /home/$USERNAME/.ssh

# Asegura permisos
touch /home/$USERNAME/.ssh/authorized_keys
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown $USERNAME:$USERNAME /home/$USERNAME/.ssh/authorized_keys

echo "[+] Instalando paquetes base..."
apt update -y
apt install -y sudo curl vim python3 python3-pip rsync gnupg

echo "[✔] Usuario '$USERNAME' creado y listo para usar con Ansible."
