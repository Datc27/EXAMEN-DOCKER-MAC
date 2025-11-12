#EQUIPO 4
## Revisión de Especificaciones del Hardware macOS

Para obtener la información del equipo, se accede a **"Acerca de esta Mac"** desde el menú Apple.

Propiedades clave a determinar:

**Identificador del equipo (Modelo):**
**Capacidad de la Memoria Principal (RAM):**
**Unidad Central de Procesamiento (CPU/Chip):**
**Recuento de Núcleos Físicos:**
**Cantidad Total de Hilos de Ejecución Lógicos:**
**Unidad de Procesamiento Gráfico (GPU/Tarjeta de Video):**

-----

# Ejecución de Docker

Ejecutamos el siguiente contenedor de ejemplo para validar la instalación de Docker:

```
docker run -d -p 8080:80 docker/getting-started
```

-----

# Despliegue de LMS moodle con Docker

### Ejecutams el script de instalación automática

Utiliza estos comandos para instalar y ejecutar Moodle de forma automatizada:

```
chmod +x build-docker.sh
./build-docker.sh
```

-----

Detalle de las operaciones para la instalación y ejecución del entorno:

## 1\. Creación del directorio

Creamos la carpeta de trabajo y accedemos a ella:

```
mkdir docker-moodle && cd docker-moodle
```

-----

## 2\. Descarga del archivo de composición

Obtenemos el archivo `docker-compose.yml` de Bitnami:

```
curl -sSL
https://raw.githubusercontent.com/bitnami/containers/main/bitnami/moodle/docker
compose.yml > docker-compose.yml
```

-----

## 3\. Definición de la red

Establecemos la red de comunicación interna para los contenedores:

```
docker network create moodle-network
```

-----

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

-----

## 5\. Inicialización de servicios

Levantamos el entorno de contenedores:

```
docker-compose up -d
```

-----

# Control y verificación de contenedores

Comprueba el estado de ejecución de los contenedores:

```
docker ps
```
