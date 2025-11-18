#!/bin/bash

if [ $# -ne 1 ]; then
  echo "se debe enviar la ruta"
  exit 1
fi

notExist=0
counter=0
for route in "$@"; do
  counter="$(($counter + 1))"
  if [ $((counter % 2)) -ne 0 -a ! -f "$route" -o ! -d "$route" ]; then
    notExist="$(($notExist + 1))"
    
    if [ -f "$route" ]; then
      echo "$route es un archivo regular"
    else
      echo "$route es un directorio"
    fi
    
  fi

done