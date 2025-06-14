#!/bin/bash

set -e

USERNAME="ansible"

# Verifica si el usuario ya existe
if id "$USERNAME" &>/dev/null; then
    echo "El usuario '$USERNAME' ya existe. Saliendo..."
    exit 1
fi

# Solicita la contraseña dos veces
echo "[?] Ingrese la contraseña para el usuario '$USERNAME':"
read -s -p "Contraseña: " PASSWORD1
echo
read -s -p "Confirme la contraseña: " PASSWORD2
echo

# Verifica que coincidan
if [[ "$PASSWORD1" != "$PASSWORD2" ]]; then
    echo "[✖] Las contraseñas no coinciden. Abortando..."
    exit 1
fi

echo "[+] Creando usuario '$USERNAME'..."

# Crea el usuario con directorio home y bash shell
useradd -m -s /bin/bash "$USERNAME"

# Establece la contraseña
echo "${USERNAME}:${PASSWORD1}" | chpasswd

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

# (Opcional) Aquí podrías copiar tu clave pública
# echo "ssh-rsa AAAA..." > /home/$USERNAME/.ssh/authorized_keys

# Asegura permisos
touch /home/$USERNAME/.ssh/authorized_keys
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown $USERNAME:$USERNAME /home/$USERNAME/.ssh/authorized_keys

echo "[+] Instalando paquetes base..."
apt update -y
apt install -y sudo curl vim python3 python3-pip rsync gnupg

echo "[✔] Usuario '$USERNAME' creado y listo para usar con Ansible."
