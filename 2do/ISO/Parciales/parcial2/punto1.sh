#!/bin/bash
# Realice un script en Bash que reciba como argumento una lista de nombres de usuario (se deberá validar 
# que se reciba al menos uno), y para cada uno de los nombres de usuario recibidos que exista en el sistema, 
# se deberá imprimir un reporte con la siguiente información:
# Nombre de usuario.
# Ruta al directorio personal (HOME), solo si el usuario tiene un directorio personal configurado y éste existe. 
# Si no, informará el texto "Sin HOME". Pista: Recuerde el archivo visto que contiene esta información.
# Cantidad de archivos (no directorios) con terminación ".docx" en su nombre que existen en su directorio 
# personal y sus subdirectorios. Se deberá informar 0 si el usuario no posee un directorio personal o no existe.

if [ $# -lt 1 ]; then
  echo "se debe enviar al menos un nombre de usuario"
  exit 1
fi

for usuario in "$@"; do
  home=$(grep "$usuario" /etc/passwd | cut -d: -f6)

  if [ -z "$home" ]; then
    continue
  fi

  if [ ! -d "$home" ]; then
    echo "sin HOME"
    echo "0 archivos que terminan con .docx"
  else
    cantidad=$( find "$home" -type f -name "*.docx" | wc -l )
    echo "el usuario $usuario con home en $home tiene $cantidad archivos que terminan en .docx"
  fi
done




































# if [ $# -lt 1 ]; then
#   echo "se debe enviar al menos un nombre de usuario"
#   exit 1
# fi
# 
# for usuario in "$@"; do
#   datos_usuario=$(grep "^$usuario:" /etc/passwd)
# 
#   if [ -z "$datos_usuario" ]; then
#     continue
#   fi
# 
#   home_dir=$(echo "$datos_usuario" | cut -d':' -f6)
# 
#   if [ -d "$home_dir" ]; then
#     echo "$usuario tiene la home dir $home_dir"
# 
#     cantidad=$(find "$home_dir" -type f -name "*.docx" | wc -l)
#   else
#     echo "SIN HOME"
#     cantidad=0
#   fi
# 
#   echo "Cantidad de archivos .docx $cantidad"
# done