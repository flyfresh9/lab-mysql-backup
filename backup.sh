#!/bin/bash

# ==========================================
# Script de Respaldo Automático para MySQL
# ==========================================

# Configuración
CONTAINER_NAME="mysql_lab"
DB_NAME="sistema_ventas"
DB_USER="root"
DB_PASS="Darkness_191092123"
BACKUP_DIR="./backups"

# Crear la carpeta de respaldos si no existe
mkdir -p "$BACKUP_DIR"

# Generar una marca de tiempo (AñoMesDía_HoraMinutoSegundo)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_${DB_NAME}_${TIMESTAMP}.sql"

echo "=========================================="
echo "Iniciando respaldo de la base de datos: $DB_NAME"
echo "=========================================="

# Ejecutar mysqldump dentro del contenedor Docker y extraer los datos
docker exec -e MYSQL_PWD="$DB_PASS" "$CONTAINER_NAME" mysqldump -u "$DB_USER" "$DB_NAME" > "$BACKUP_FILE"

# Comprimir el archivo SQL con gzip para ahorrar espacio
gzip "$BACKUP_FILE"

echo "¡Respaldo completado con éxito!"
echo "Archivo guardado en: ${BACKUP_FILE}.gz"
echo "=========================================="