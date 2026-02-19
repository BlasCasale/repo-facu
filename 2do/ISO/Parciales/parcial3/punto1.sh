#!/bin/bash

if [ $# -eq 0 ]; then
  echo "se debe enviar al menos un nombre de usuario a buscar"
  exit 1
fi

for usuario in "$@"; do
  home=$( grep "$usuario" /etc/passwd | cut -d: -f6 )

  if [ -d "$home" ]; then
    echo "Sin HOME"
    echo "0 archivos con patron *.docx"
  else
    echo "usuario: $usuario"
    cantidad=$(find "$home" -type f -name "*.docx" | wc -l )
    echo "cantidad de archivos con patron *.docx $cantidad"
  fi
done
