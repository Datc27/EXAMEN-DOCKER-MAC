````markdown
# EQUIPO 4
## Despliegue de LMS Moodle con Docker

Este proyecto levanta un entorno completo de Moodle con base de datos MariaDB utilizando Docker Compose.

### 🚀 Instalación Rápida

No es necesario configurar redes ni volúmenes manualmente. El proyecto ya incluye la configuración lista en `docker-compose.yml`.

1. **Da permisos de ejecución al script:**
   ```bash
   chmod +x build-docker.sh
````

2.  **Inicia el despliegue:**
    ```bash
    ./build-docker.sh
    ```

El script se encargará de levantar los servicios automáticamente.

-----

### 🌐 Acceso al sitio

Una vez que termine de cargar (puede tardar unos minutos la primera vez), accede a:
👉 http://localhost:8080

### 🔐 Credenciales

| Servicio | Usuario | Contraseña |
| :--- | :--- | :--- |
| **Moodle (Login Web)** | `admin` | `Admin123!` |
| **Base de Datos** | `jm` | `1234` |

-----

### 🛠 Comandos útiles

**Verificar contenedores activos:**

```bash
docker ps
```

**Detener el entorno:**

```bash
docker-compose down
```

**Detener y borrar volúmenes (Reiniciar de cero):**

```bash
docker-compose down -v
```

```
```
