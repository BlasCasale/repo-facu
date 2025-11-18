#!/bin/bash

if [ $# -n3 3 ]; then
  echo "se debe enviar el nombre del usuario"
  exit 1
fi

while true; do
    if who | grep -q "$usuario"; then
        echo "Usuario $usuario logueado"
        break
    fi
    sleep 10
done

exit 0