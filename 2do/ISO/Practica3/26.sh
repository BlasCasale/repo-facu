#!/bin/bash

array=()

initialize() {
  array=()
}

addElement() {
  if [ $# -ne 1 ]; then
    echo "se debe enviar un elemento a agregar"
    return 1
  fi

  array+=("$1")
}

deleteElem() {
  if [ $# -ne 1 ]; then
    echo "se debe enviar la posicion a eliminar"
    return 1
  fi

  if [ $1 -ge 0 -a $1 -lt ${#array[@]} ]; then
    unset array[$1]
  fi
    
  echo "se debe enviar una posicion valida"
  return 1
}

length() {
  echo ${#array[@]}
}

print() {
  for elem in "${array[@]}"; do
    echo "$elem"
  done
}

initializeWithValues() {
  if [ $# -ne 2 ]; then
    echo "se deben enviar 2 valores"
    return 1    
  fi

  zero=0

  for i in {$zero..$1}; do
    array[i]="$2"
  done
}