#!/bin/bash

if [ $# -ne 1 ]; then
  echo "se debe enviar la ruta"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "se debe enviar una ruta valida"
  exit 1
fi

ls $1 | tr 'a-zA-Z' 'A-Za-z' | tr -d 'aA'

ls $1