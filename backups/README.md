# Laboratorio de Respaldo Automatizado para MySQL con Docker

Sistema automatizado de respaldos para bases de datos MySQL ejecutándose en contenedores Docker, diseñado mediante Bash scripting para garantizar la integridad y compresión de la información.

## Tecnologías Utilizadas
- Docker & Docker Compose
- MySQL 8.0
- Bash Scripting
- Linux / CLI

## Estructura del Proyecto
- `docker-compose.yml`: Configuración del servicio de base de datos.
- `backup.sh`: Script automatizado que realiza el volcado (`mysqldump`) y compresión (`gzip`).
- `backups/`: Directorio de destino para los respaldos comprimidos.