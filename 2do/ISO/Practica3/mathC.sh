#!/bin/bash

if [ $# -lt 3 ]; then
  echo "Se debe enviar la operación y los 2 números como parametros"
fi

case $1 in
  "+")
    echo "$2 + $3 = $(($2 + $3))"
    ;;
  "-")
    echo "$2 - $3 = $(($2 - $3))"
    ;;
  "*")
    echo "$2 * $3 = $(($2 * $3))"
    ;;
  "/")
    echo "$2 / $3 = $(($2 / $3))"
    ;;
  *)
    echo "No se ha enviado una operación válida"
    ;;
esac