#!/bin/bash

# Realice un script en bash que cada 1 hora busque en cada directorio HOME (y sus subdirectorios) 
# de cada usuario del sistema a ver si dentro de la misma el usuario contiene un archivo cuyo nombre 
# es igual al parámetro que debe recibir el script. En caso de encontrarse esta situación, se debe 
# registrar en un archivo de log llamado "archivo-encontrado-<PARAMETRO>.log" 
# (ubicado en el directorio correspondiente según FHS) el full path del archivo encontrado. <PARAMETRO> 
# representa el valor del parámetro que recibe el script.
# La ejecución del script finaliza, retornando el código 0, una vez que se encontró al menos 10 veces el 
# nombre del archivo entre todos los HOME de usuario. Se debe validar que el script recibe un único parámetro 
# (que es el nombre del archivo a buscar) y en caso contrario debe imprimir un mensaje de error correspondiente 
# y finalizar con el código de error 2.

if [ $# -ne 1 ]; then
  echo "se debe enviar un solo parametro"
  exit 2
fi

nombre="$1"
full_path="/var/log/$nombre.log"

counter=0

while true; do
  
  while read -r ruta_archivo; do
    ((counter++))
    echo "$ruta_archivo" >> "$full_path"
    if [ "$counter" -eq 10 ]; then
      exit 0
    fi
  done < <(find /home -name "$nombre")

  sleep 3600
done  
