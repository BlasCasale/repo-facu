#!/bin/bash

L=()

init() {
  if [ $# -eq 0 ]; then
    L=()
    return 0
  fi

  L=("$@")
}

push() {
  if [ $# -eq 0 ]; then
    return 1
  fi

  for elemento in "$@"; do
    L+=("$elemento")
  done
}

last() {
  if [ ${#L[*]} -eq 0 ]; then
    return 1
  fi

  ultimoIndice=$((${#L[*]} - 1))
  ultimo=${L[ultimoIndice]}

  unset "L[ultimoIndice]"

  echo "se elimino $ultimo"
}

first() {
  if [ ${#L[*]} -eq 0 ]; then
    return 1
  fi

  primero=${L[0]}
  unset "L[0]"

  L=("${L[@]}")
  echo "se elimino $primero"
}

size() {
  echo "el tamaño de la lista es de ${#L[*]}"
}

print() {
  if [ ${#L[*]} -eq 0 ]; then
    echo "lista vacia"
    return 1
  fi

  for elemento in "${L[@]}"; do
    echo "$elemento"
  done
}

init
push 2 "hola soy blas" 3 4 "hola soy blas" "quiero aprobar iso"
first
size
print
last
size
print