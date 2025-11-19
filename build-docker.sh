#!/bin/bash

echo "Iniciando despliegue de Moodle con Docker Compose..."

# 1. (Opcional) Si quieres limpiar contenedores viejos para evitar errores
# docker-compose down -v 

# 2. Levantar los servicios usando TU archivo docker-compose.yml
# Docker Compose creará automáticamente las redes y volúmenes necesarios.
docker-compose up -d

# 3. Mostrar el estado
echo "Esperando unos segundos para que inicien los servicios..."
sleep 10
docker ps

echo "Listo. Accede a Moodle en http://localhost:8080"
