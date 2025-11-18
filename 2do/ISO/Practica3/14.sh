#!/bin/bash

if [ $# -ne 3 ]; then
  echo "se debe enviar laRuta opcion nuevoNombre"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "se debe enviar una ruta válida"
  exit 1
fi

if [ $2 != "-a" -a $2 != "-b" ]; then
  echo "se debe enviar en el segundo parámetro 'a' o 'b'"
  exit 1
fi

archivos=($(find $1 -maxdepth 1 -type f))

if [ $2 = "-a" ]; then
  for el in "${archivos[@]}"; do
    name=$(basename "$el")
    nameWithoutExt="${name%.*}"
    ext="${name##*.}"
    dirBase=$(dirname "$el")
    newName="$dirBase/${nameWithoutExt}$3.${ext}"
    mv "$el" "$newName" 
  done
else
  for el in "${archivos[@]}"; do
    name=$(basename "$el")
    nameWithoutExt="${name%.*}"
    ext="${name##*.}"
    dirBase=$(dirname "$el")
    newName="$dirBase/$3${nameWithoutExt}.${ext}"
    mv "$el" "$newName"
  done
fi

echo "nombre del directorio cambiado"

exit 0