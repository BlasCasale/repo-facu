#! /bin/bash

if [ $# -lt 2 ]; then
  echo "Se debe enviar 2 parametros para ejecutar el script"
  exit 1
fi

echo "La suma de $1 y $2 es $(($1 + $2))"
echo "La resta de $1 y $2 es $(($1 - $2))"
echo "La multiplicación de $1 y $2 es $(($1 * $2))"
echo "La división de $1 y $2 es $(($1 / $2))"

if [ $1 -ge $2 ]; then
  echo "El número mas grande es $1"
else
  echo "El numero mas grande es $2"
fi