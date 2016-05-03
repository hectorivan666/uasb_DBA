#!/bin/bash
# Author: Héctor Chinchilla.
# Fecha : 2 de mayo del 2016
# grupo: 2
# Descripción: Script para sacar una copia de seguridad de la base de datos musicdb
# We are using username postgres here which is similar to mysql root user
#

USER="postgres"
PASS="hola123"
BASE="musicdb_test"
DIR="/home/hector/RespaldoMusicdb"
FECHA=`date +%d-%m-%Y`

# Hace Backup de DB, poniendo como nombre la fecha y hora del dia en que se ejecuta 
export FECHA=`date +%d-%m-%Y_%H:%M:%S`
export NAME=NAMEBACKUPBASEDATOS_${FECHA}.dump
export DIR="/home/hector/RespaldoMusicdb"
USER_DB="postgres"
NAME_DB="musicdb_test"
cd $DIR
> ${NAME}
export PGPASSWORD="hola123"
chmod 777 ${NAME}
echo "procesando la copia de la base de datos"
pg_dump -U $USER_DB -h localhost --port 5432 -f ${NAME} $NAME_DB
echo "backup terminado"
 
#Elimina archivos mayor a un dia
find /home/hector/RespaldoMusicdb/*.dump -mtime +1 -exec rm {} \;
