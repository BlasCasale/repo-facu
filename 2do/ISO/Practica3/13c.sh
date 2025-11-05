#!/bin/bash

if [ -z $1 ]; then
  echo "Se debe enviar el nombre del archivo a buscar"
  exit 1
fi

if [ -e $1 ]; then
  if [ -f $1 ]; then
    echo "Es un archivo regular"
  elif [ -d $1 ]; then
    echo "Es un directorio"
  fi
else
    rm -rf $1
    mkdir $1
fi

exit 0