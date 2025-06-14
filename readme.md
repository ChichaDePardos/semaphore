# 🛠 Instalador de Agente Linux para Automatización con Ansible

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Ubuntu Compatible](https://img.shields.io/badge/OS-Ubuntu%2FDebian-blue.svg)](#)
[![Status](https://img.shields.io/badge/status-stable-brightgreen.svg)](#)

---

## 📚 Índice

- [📄 Descripción](#-descripción)
- [🚀 ¿Qué hace este script?](#-qué-hace-este-script)
- [🧪 Cómo usarlo](#-cómo-usarlo)
- [🔒 Seguridad](#-seguridad)
- [📋 Requisitos](#-requisitos)
- [✅ Licencia](#-licencia)

---

## 📄 Descripción

Este script permite configurar de forma rápida y segura un nuevo servidor Linux para que actúe como agente gestionado por **Ansible**. Está pensado para ser ejecutado en máquinas recién provisionadas (por ejemplo, VPS, entornos en la nube o máquinas físicas) y automatiza los pasos esenciales para que estén listas para recibir tareas desde un controlador central.

---

## 🚀 ¿Qué hace este script?

- 🧑‍💻 Crea un usuario llamado `ansible` y solicitara la contraseña segura.
- 🔐 Configura privilegios de superusuario (`sudo`) sin contraseña para dicho usuario.
- 📁 Prepara el entorno SSH (`~/.ssh`) con permisos seguros, listo para autenticación por clave.
- 📦 Instala herramientas y paquetes esenciales: `sudo`, `rsync`, `curl`, `vim`, `python3`, `pip`, entre otros.
- ✅ Deja el sistema preparado para ejecutar playbooks Ansible desde un host remoto.

---

## 🧪 Cómo usarlo

Puedes ejecutarlo directamente desde GitHub con:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/ChichaDePardos/semaphore/main/init_ansible_agent.sh)
````

O con `wget`:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/ChichaDePardos/semaphore/main/init_ansible_agent.sh)
```

> ⚠️ Se recomienda ejecutar como `root` o mediante `sudo`.

---

## 🔒 Seguridad

* El script crea una cuenta con contraseña predeterminada, **recomendamos cambiarla o deshabilitar el login por contraseña** una vez completada la instalación.
* Si deseas habilitar autenticación sin contraseña, puedes modificar el script para incluir tu clave pública SSH en `authorized_keys`.

---

## 📋 Requisitos

* Distribución Linux basada en **Debian/Ubuntu**.
* Acceso a `bash`, `curl` o `wget`.
* Acceso a Internet para descargar el script desde GitHub.

---

## ⚠️ Licencia y uso
Este proyecto es de uso privado exclusivo de ChichaDePardos.
No está permitido su uso, redistribución, modificación ni publicación por terceros sin autorización expresa.
Cualquier uso no autorizado será considerado una violación a los derechos reservados de sus autores.


