#!/bin/bash

if [ ! -d $1 ]; then
  echo "se debe enviar un directorio válido"
  exit 4
fi

counterWrite=0
counterRead=0

for file in "$1"/*; do
  if [ -f "$file" ]; then
    if [ -r "$file" ]; then
      ((counterRead++))
    fi
    if [ -w "$file" ]; then  
      ((counterWrite++))
    fi
  fi
done

echo "se contraron $counterWrite archivos con permisos de escritura"
echo "se contaron $counterRead archivos con permisos de lectura"

exit 0