#!/bin/bash
# Utilizando Bash, desarrolle las siguientes funciones para implementar una estructura de LISTA,1
# la que deberá almacenarse en un arreglo:
# init: Inicializa la lista. Puede recibir 0 o más parámetros que representan elementos iniciales para la lista.
# push: Agrega 1 o más elementos al final de la lista.
# last: Devuelve el último elemento de la lista, quitándolo de la misma.
# first: Devuelve el primer elemento de la lista, quitándolo de la misma.
# size: Devuelve el tamaño de la lista (cantidad de elementos en la misma).
# print: Imprime todos los elementos de la lista.
# Luego, escriba un cuerpo principal de script que cree una lista L sin elementos y utilice todas las funciones 
# anteriores sobre L. No hace falta que presente un menú, simplemente ejemplifique cómo se invoca cada una de las 
# funciones. Recuerde validar en cada función que los parámetros y el estado de la lista sean adecuados para la 
# operación que se intenta realizar.

L=()

function init(){
  L=("$@")
}

function push(){
  if [ $# -lt 1 ]; then
    return 1
  fi

  for elemento in "$@"; do
    L+=("$elemento")
  done
}

function last(){
  if [ ${#L[*]} -lt 1 ]; then
    return 1
  fi;

  ultimo=${L[-1]}
  echo "$ultimo borrado"
  unset L[-1]
}

function first() {
  if [ ${#L[*]} -lt 1 ]; then
    return 1
  fi;

  primero=${L[0]}
  echo "$primero borrado"
  unset L[0]
  L=("${L[@]}")
}

function size(){
  echo "tamaño ${#L[*]}"
}

function print(){
  for elemento in "${L[@]}"; do
    echo "elemento $elemento"
  done
}

init
first
last
size
push 1 2 6 7 "hola mundo"
print
first
last
print
size