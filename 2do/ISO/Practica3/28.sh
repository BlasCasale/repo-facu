#!/bin/bash

array=()

for file in "/home"/*; do
  ext="${file##*.}"
  if [ -f "$file" -a $ext = ".doc" ]; then
    array+=("$file")
  fi
done

function printContent() {
  if [ $# -ne 1 ]; then
    echo "se debe enviar el nombre del archivo para buscar"
    return 1
  fi

  flag=1

  for file in "${array[@]}"; do
    if [ "$1" = "$file" ]; then
      cat "$1"
      flag=0
      break
    fi
  done

  if [ $flag -eq 1 ]; then
    echo "archivo no encontrado"
    return 5
  fi
}

function quantityFiles() {
  echo "${#array[*]}"
}

function deleteFile() {
  if [ $# -ne 1 ]; then
    echo "se debe enviar el nombre del archivo para buscar"
    return 1
  fi

  flag=1

  index=0

  for file in "${array[@]}"; do
    if [ "$1" = "$file" ]; then
      flag=0
      break
    fi
    ((index++))
  done

  if [ $flag -eq 1 ]; then
    echo "archivo no encontrado"
    return 10
  fi

  while true; do
    read -p "desea borrar logicamente el archivo? (si o no)" answer

    case $answer in
      "si")
        unset array[$index]
        break
        ;;
      "no")
        rm -f "${array[$index]}"
        unset array[$index]
        break
        ;;
      *)
        echo "respuesta invalida, envie 'si' o 'no'"
        ;;
    esac
  done
}