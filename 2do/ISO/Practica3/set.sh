#!/bin/bash

set=()

initialize() {
  set=()
}

initialize_with() {
  if [ $# -lt 1 ]; then
    echo "se debe enviar al menos 1 parametro"
    return 1
  fi

  for arg in "$@"; do
    contains "$arg"
      if [ $? -eq 1 ]; then
        set+=("$arg")
      fi
  done
}

contains() {
  if [ -z $1 ]; then
    echo "se debe enviar el valor a buscar"
    return 2
  fi

  for value in "${set[@]}"; do
    if [ "$1" = "$value" ]; then
      return 0 #encontrado
    fi
  done
  
  return 1 #no encontrado
}

add() {
  if [ $# -ne 1 ]; then
    echo "se debe enviar un valor a agregar"
    return 1
  fi

  contains $1

  if [ $? -eq 1 ]; then
    set+=("$1")
  fi
}

remove() {
  if [ $# -lt 1 ]; then
    echo "se debe enviar los valores a eliminar"
    return 0
  fi

  counter=0

  for value in "$@"; do
    for i in "${!set[@]}"; do
      if [ "$value" = "${set[$i]}" ]; then
          unset set[$i]
          ((counter++))
          break
      fi
    done
  done

  if [ $counter -ne 0 ]; then
    return 0
  fi

  return 1
}

print() {
  for value in "${set[@]}"; do
    echo "$value"
  done
}

print_sorted() {
  for value in "${set[@]}"; do
    echo "$value"
  done | sort
}