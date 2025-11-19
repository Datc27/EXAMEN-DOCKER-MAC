#EQUIPO 4
# Ejecución de Docker

```
docker run -d -p 8080:80 docker/getting-started
```

-----

# Despliegue de LMS moodle con Docker

### Ejecutamos el script de instalación automática

```
chmod +x build-docker.sh
./build-docker.sh
```
-----

## 1\. Creamos el directorio
```
mkdir docker-moodle && cd docker-moodle
```

## 2\. Descarga del archivo
```
curl -sSL
https://raw.githubusercontent.com/bitnami/containers/main/bitnami/moodle/docker
compose.yml > docker-compose.yml
```
## 3\. Definición de la red

```
docker network create moodle-network
```

## 4\. Configuración de voúmenes

### a) Volumen para MariaDB (Base de Datos)

```
docker volume create --name mariadb_data
docker run -d --name mariadb \ --env ALLOW_EMPTY_PASSWORD=yes \ --env MARIADB_USER=bn_moodle \ --env MARIADB_PASSWORD=bitnami \ --env MARIADB_DATABASE=bitnami_moodle \ --network moodle-network \ --volume mariadb_data:/bitnami/mariadb \
bitnami/mariadb:latest
```

### b) Volúmenes para moodle

```
docker volume create --name moodle_data
docker run -d --name moodle \ -p 8080:8080 -p 8443:8443 \ --env ALLOW_EMPTY_PASSWORD=yes \ --env MOODLE_DATABASE_USER=bn_moodle \ --env MOODLE_DATABASE_PASSWORD=bitnami \ --env MOODLE_DATABASE_NAME=bitnami_moodle \ --network moodle-network \ --volume moodle_data:/bitnami/moodle \ --volume moodledata_data:/bitnami/moodledata \
bitnami/moodle:latest
```

## 5\. Inicialización de servicios

```
docker-compose up -d
```

-----

# Verificación de contenedores

```
docker ps
```
