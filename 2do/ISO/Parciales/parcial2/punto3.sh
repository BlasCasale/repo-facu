#/bin/bash
# Escriba un script que reciba el path de un archivo por parámetro, debe validar que exista y, en caso afirmativo,
# informe qué permisos tiene el usuario sobre dicho archivo. En caso de tener permisos de ejecución, quitarlos.

if [ $# -lt 1 ]; then
  echo "se debe enviar el archivo a buscar"
  exit 1
fi

if [ ! -e "$1" ]; then
  echo "no existe el archivo a buscar"
  exit 0
fi

permisos=$(ls -l "$1" | cut -d' ' -f1)

echo "se tiene $permisos sobre el archivo"

if [ -x "$1" ]; then
  chmod -x "$1"
fi