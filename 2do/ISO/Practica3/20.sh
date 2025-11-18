#!/bin/bash

declare -a stack=()

function push (){
  if [ $# -ne 1 ]; then
    echo "se debe enviar un solo valor a almacenar"
    return 1
  fi

  stack+=("$1")  
}

function pop (){
  if [ ${#stack[@]} -eq 0 ]; then
    echo "la pila esta vacia"
    return 1
  fi

  local elem="${stack[-1]}"
  unset stack[-1]
  echo "se elimino $elem del tope de pila"
}

function length() {
  echo "${#stack[*]}"
}

function print() {
  for elem in "${stack[@]}"; do
    echo "$elem"
  done
}

push "hola soy blas"
push 3
push "hola soy galo"
push 8
push 10
push 2

pop
pop

length

print